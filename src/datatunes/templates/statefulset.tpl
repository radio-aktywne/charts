apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "datatunes.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "datatunes.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "datatunes.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "datatunes.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/datatunes:{{ .Chart.AppVersion }}"
          ports:
            - name: s3
              protocol: TCP
              containerPort: {{ required "database.server.ports.s3 is required" (((.Values.database).server).ports).s3 | int }}
            - name: web
              protocol: TCP
              containerPort: {{ required "database.server.ports.web is required" (((.Values.database).server).ports).web | int }}
          envFrom:
            - configMapRef:
                name: {{ include "datatunes.configMapName" . | quote }}
            - secretRef:
                name: {{ include "datatunes.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "datatunes.volumeName" . | quote }}
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
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "datatunes.volumeMetadata" . | nindent 8 }}
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
