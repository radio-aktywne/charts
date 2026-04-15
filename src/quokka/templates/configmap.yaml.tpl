apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "quokka.configMapMetadata" . | nindent 2 }}
data:
  QUOKKA__LIMITS__CLIENTS: {{ required "quokka.limits.clients is required" ((.Values.quokka).limits).clients | int | quote }}
  QUOKKA__LIMITS__SOURCES: {{ required "quokka.limits.sources is required" ((.Values.quokka).limits).sources | int | quote }}
  QUOKKA__SERVER__PORT: {{ required "quokka.server.port is required" ((.Values.quokka).server).port | int | quote }}
