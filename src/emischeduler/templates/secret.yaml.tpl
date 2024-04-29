apiVersion: v1
kind: Secret
metadata:
  {{- include "emischeduler.secretMetadata" . | nindent 2 }}
stringData:
  EMISCHEDULER__EMIARCHIVE__S3__USER: {{ required "app.emiarchive.s3.user is required" (((.Values.app).emiarchive).s3).user | quote }}
  EMISCHEDULER__EMIARCHIVE__S3__PASSWORD: {{ required "app.emiarchive.s3.password is required" (((.Values.app).emiarchive).s3).password | quote }}
