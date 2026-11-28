apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "zircon.configMapMetadata" . | nindent 2 }}
data:
  ZIRCON__SERVER__PORT: {{ required "zircon.server.port is required" ((.Values.zircon).server).port | int | quote }}
