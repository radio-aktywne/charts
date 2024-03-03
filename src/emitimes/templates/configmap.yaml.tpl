apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emitimes.configMapMetadata" . | nindent 2 }}
data:
  EMITIMES_PORT: {{ required "database.port is required" (.Values.database).port | int | quote }}
  EMITIMES_CALENDAR: {{ required "database.calendar is required" (.Values.database).calendar | quote }}
