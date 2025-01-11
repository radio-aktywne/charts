apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "emerald.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emerald.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emerald.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emerald.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/emerald:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: s3
              protocol: TCP
              containerPort: {{ required "emerald.server.ports.s3 is required" (((.Values.emerald).server).ports).s3 | int }}
            - name: web
              protocol: TCP
              containerPort: {{ required "emerald.server.ports.web is required" (((.Values.emerald).server).ports).web | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emerald.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emerald.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "emerald.volumeName" . | quote }}
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
        {{- include "emerald.volumeMetadata" . | nindent 8 }}
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
