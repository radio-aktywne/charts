apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "datashows.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "datashows.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "datashows.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "datashows.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/datashows:{{ .Chart.AppVersion }}"
          ports:
            - name: sql
              protocol: TCP
              containerPort: {{ required "database.server.ports.sql is required" (((.Values.database).server).ports).sql | int }}
            - name: http
              protocol: TCP
              containerPort: {{ required "database.server.ports.http is required" (((.Values.database).server).ports).http | int }}
            - name: rpc
              protocol: TCP
              containerPort: {{ required "database.server.ports.rpc is required" (((.Values.database).server).ports).rpc | int }}
          envFrom:
            - configMapRef:
                name: {{ include "datashows.configMapName" . | quote }}
            - secretRef:
                name: {{ include "datashows.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "datashows.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /health
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /health?ready=1
              port: http
            failureThreshold: 6
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "datashows.volumeMetadata" . | nindent 8 }}
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
