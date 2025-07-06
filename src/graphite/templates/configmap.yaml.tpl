apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "graphite.configMapMetadata" . | nindent 2 }}
data:
  GRAPHITE__SERVER__PORT: {{ required "graphite.server.port is required" ((.Values.graphite).server).port | int | quote }}
