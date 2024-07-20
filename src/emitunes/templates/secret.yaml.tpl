apiVersion: v1
kind: Secret
metadata:
  {{- include "emitunes.secretMetadata" . | nindent 2 }}
stringData:
  EMITUNES__DATATUNES__SQL__PASSWORD: {{ required "app.datatunes.sql.password is required" (((.Values.app).datatunes).sql).password | quote }}
  EMITUNES__MEDIATUNES__S3__USER: {{ required "app.mediatunes.s3.user is required" (((.Values.app).mediatunes).s3).user | quote }}
  EMITUNES__MEDIATUNES__S3__PASSWORD: {{ required "app.mediatunes.s3.password is required" (((.Values.app).mediatunes).s3).password | quote }}
