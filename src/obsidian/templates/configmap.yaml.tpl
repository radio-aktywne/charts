apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "obsidian.configMapMetadata" . | nindent 2 }}
data:
  OBSIDIAN__SERVER__PORT: {{ required "obsidian.server.port is required" ((.Values.obsidian).server).port | int | quote }}
