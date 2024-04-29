apiVersion: v1
kind: Secret
metadata:
  {{- include "emirecorder.secretMetadata" . | nindent 2 }}
stringData:
  EMIRECORDER__EMIARCHIVE__S3__USER: {{ required "app.emiarchive.s3.user is required" (((.Values.app).emiarchive).s3).user | quote }}
  EMIRECORDER__EMIARCHIVE__S3__PASSWORD: {{ required "app.emiarchive.s3.password is required" (((.Values.app).emiarchive).s3).password | quote }}
