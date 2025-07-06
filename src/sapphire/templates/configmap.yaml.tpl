apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "sapphire.configMapMetadata" . | nindent 2 }}
data:
  SAPPHIRE__SERVER__PORT: {{ required "sapphire.server.port is required" ((.Values.sapphire).server).port | int | quote }}
