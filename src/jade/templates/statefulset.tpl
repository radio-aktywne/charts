apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "jade.statefulSetMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "jade.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "jade.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "jade.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/jade:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: s3
              protocol: TCP
              containerPort: {{ required "jade.server.ports.s3 is required" (((.Values.jade).server).ports).s3 | int }}
            - name: web
              protocol: TCP
              containerPort: {{ required "jade.server.ports.web is required" (((.Values.jade).server).ports).web | int }}
          envFrom:
            - configMapRef:
                name: {{ include "jade.configMapName" . | quote }}
            - secretRef:
                name: {{ include "jade.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "jade.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /health/live
              port: s3
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /health/live
              port: s3
            failureThreshold: 6
          {{- with (.Values.container).spec }}
          {{- toYaml . | nindent 10 }}
          {{- end }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "jade.volumeMetadata" . | nindent 8 }}
      spec:
        {{- if (.Values.volume).class }}
        storageClassName: {{ (.Values.volume).class | quote }}
        {{- end }}
        accessModes:
          {{- required "volume.access is required" (.Values.volume).access | toStrings | toYaml | nindent 10 }}
        resources:
          requests:
            storage: {{ required "volume.size is required" (.Values.volume).size | quote }}
        {{- with (.Values.volume).spec }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
  {{- end }}
  {{- with (.Values.statefulSet).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
