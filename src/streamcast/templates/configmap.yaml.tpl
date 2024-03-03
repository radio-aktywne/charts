apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "streamcast.configMapMetadata" . | nindent 2 }}
data:
  STREAMCAST_PORT: {{ required "app.port is required" (.Values.app).port | int | quote }}
