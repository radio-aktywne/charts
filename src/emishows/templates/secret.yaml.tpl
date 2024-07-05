apiVersion: v1
kind: Secret
metadata:
  {{- include "emishows.secretMetadata" . | nindent 2 }}
stringData:
  EMISHOWS__DATASHOWS__SQL__PASSWORD: {{ required "app.datashows.sql.password is required" (((.Values.app).datashows).sql).password | quote }}
  EMISHOWS__DATATIMES__CALDAV__USER: {{ required "app.datatimes.caldav.user is required" (((.Values.app).datatimes).caldav).user | quote }}
  EMISHOWS__DATATIMES__CALDAV__PASSWORD: {{ required "app.datatimes.caldav.password is required" (((.Values.app).datatimes).caldav).password | quote }}
