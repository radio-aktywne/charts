apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "quokka.configMapMetadata" . | nindent 2 }}
data:
  QUOKKA__SERVER__PORT: {{ required "quokka.server.port is required" ((.Values.quokka).server).port | int | quote }}
