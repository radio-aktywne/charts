apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "amber.statefulSetMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "amber.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "amber.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "amber.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/amber:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: s3
              protocol: TCP
              containerPort: {{ required "amber.server.ports.s3 is required" (((.Values.amber).server).ports).s3 | int }}
            - name: web
              protocol: TCP
              containerPort: {{ required "amber.server.ports.web is required" (((.Values.amber).server).ports).web | int }}
          envFrom:
            - configMapRef:
                name: {{ include "amber.configMapName" . | quote }}
            - secretRef:
                name: {{ include "amber.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "amber.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /minio/health/live
              port: s3
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /minio/health/live
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
        {{- include "amber.volumeMetadata" . | nindent 8 }}
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
