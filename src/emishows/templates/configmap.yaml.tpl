apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emishows.configMapMetadata" . | nindent 2 }}
data:
  EMISHOWS__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  EMISHOWS__DATASHOWS__SQL__HOST: {{ required "app.datashows.sql.host is required" (((.Values.app).datashows).sql).host | quote }}
  EMISHOWS__DATASHOWS__SQL__PORT: {{ required "app.datashows.sql.port is required" (((.Values.app).datashows).sql).port | int | quote }}
  EMISHOWS__DATATIMES__CALDAV__SCHEME: {{ required "app.datatimes.caldav.scheme is required" (((.Values.app).datatimes).caldav).scheme | quote }}
  EMISHOWS__DATATIMES__CALDAV__HOST: {{ required "app.datatimes.caldav.host is required" (((.Values.app).datatimes).caldav).host | quote }}
  EMISHOWS__DATATIMES__CALDAV__PORT: {{ required "app.datatimes.caldav.port is required" (((.Values.app).datatimes).caldav).port | int | quote }}
  {{- if (((.Values.app).datatimes).caldav).path }}
  EMISHOWS__DATATIMES__CALDAV__PATH: {{ .Values.app.datatimes.caldav.path | quote }}
  {{- end }}
  EMISHOWS__DATATIMES__CALDAV__CALENDAR: {{ required "app.datatimes.caldav.calendar is required" (((.Values.app).datatimes).caldav).calendar | quote }}
