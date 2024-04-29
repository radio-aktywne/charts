apiVersion: v1
kind: Secret
metadata:
  {{- include "emishows.secretMetadata" . | nindent 2 }}
stringData:
  EMISHOWS__DATABASE__SQL__PASSWORD: {{ required "app.database.sql.password is required" (((.Values.app).database).sql).password | quote }}
  EMISHOWS__EMITIMES__CALDAV__USER: {{ required "app.emitimes.caldav.user is required" (((.Values.app).emitimes).caldav).user | quote }}
  EMISHOWS__EMITIMES__CALDAV__PASSWORD: {{ required "app.emitimes.caldav.password is required" (((.Values.app).emitimes).caldav).password | quote }}
