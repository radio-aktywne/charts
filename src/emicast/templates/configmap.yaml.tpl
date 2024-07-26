apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emicast.configMapMetadata" . | nindent 2 }}
data:
  EMICAST__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
