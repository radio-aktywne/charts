apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emishows.configMapMetadata" . | nindent 2 }}
data:
  EMISHOWS__SERVER__PORT: {{ required "app.port is required" (.Values.app).port | int | quote }}
  EMISHOWS__DATABASE__HOST: {{ required "app.database.host is required" ((.Values.app).database).host | quote }}
  EMISHOWS__DATABASE__PORT: {{ required "app.database.port is required" ((.Values.app).database).port | int | quote }}
  EMISHOWS__EMITIMES__HOST: {{ required "app.emitimes.host is required" ((.Values.app).emitimes).host | quote }}
  EMISHOWS__EMITIMES__PORT: {{ required "app.emitimes.port is required" ((.Values.app).emitimes).port | int | quote }}
  EMISHOWS__EMITIMES__CALENDAR: {{ required "app.emitimes.calendar is required" ((.Values.app).emitimes).calendar | quote }}
