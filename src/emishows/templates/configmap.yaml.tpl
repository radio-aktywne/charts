apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emishows.configMapMetadata" . | nindent 2 }}
data:
  EMISHOWS__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  EMISHOWS__DATABASE__SQL__HOST: {{ required "app.database.sql.host is required" (((.Values.app).database).sql).host | quote }}
  EMISHOWS__DATABASE__SQL__PORT: {{ required "app.database.sql.port is required" (((.Values.app).database).sql).port | int | quote }}
  EMISHOWS__EMITIMES__CALDAV__SCHEME: {{ required "app.emitimes.caldav.scheme is required" (((.Values.app).emitimes).caldav).scheme | quote }}
  EMISHOWS__EMITIMES__CALDAV__HOST: {{ required "app.emitimes.caldav.host is required" (((.Values.app).emitimes).caldav).host | quote }}
  EMISHOWS__EMITIMES__CALDAV__PORT: {{ required "app.emitimes.caldav.port is required" (((.Values.app).emitimes).caldav).port | int | quote }}
  {{- if (((.Values.app).emitimes).caldav).path }}
  EMISHOWS__EMITIMES__CALDAV__PATH: {{ .Values.app.emitimes.caldav.path | quote }}
  {{- end }}
  EMISHOWS__EMITIMES__CALDAV__CALENDAR: {{ required "app.emitimes.caldav.calendar is required" (((.Values.app).emitimes).caldav).calendar | quote }}
