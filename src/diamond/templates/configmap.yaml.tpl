apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "diamond.configMapMetadata" . | nindent 2 }}
data:
  DIAMOND__SERVER__PORT: {{ required "diamond.server.port is required" ((.Values.diamond).server).port | int | quote }}
