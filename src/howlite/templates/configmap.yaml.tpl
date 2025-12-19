apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "howlite.configMapMetadata" . | nindent 2 }}
data:
  HOWLITE__CALENDAR: {{ required "howlite.calendar is required" (.Values.howlite).calendar | quote }}
  HOWLITE__SERVER__PORT: {{ required "howlite.server.port is required" ((.Values.howlite).server).port | int | quote }}
