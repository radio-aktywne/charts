apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "streamcast.configMapMetadata" . | nindent 2 }}
data:
  STREAMCAST__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
