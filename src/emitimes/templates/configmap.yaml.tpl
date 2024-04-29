apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emitimes.configMapMetadata" . | nindent 2 }}
data:
  EMITIMES__SERVER__PORT: {{ required "database.server.port is required" ((.Values.database).server).port | int | quote }}
  EMITIMES__CALENDAR: {{ required "database.calendar is required" (.Values.database).calendar | quote }}
