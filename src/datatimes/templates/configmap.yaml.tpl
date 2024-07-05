apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "datatimes.configMapMetadata" . | nindent 2 }}
data:
  DATATIMES__SERVER__PORT: {{ required "database.server.port is required" ((.Values.database).server).port | int | quote }}
  DATATIMES__CALENDAR: {{ required "database.calendar is required" (.Values.database).calendar | quote }}
