apiVersion: v1
kind: Secret
metadata:
  {{- include "emirecords.secretMetadata" . | nindent 2 }}
stringData:
  EMIRECORDS__MEDIARECORDS__S3__USER: {{ required "app.mediarecords.s3.user is required" (((.Values.app).mediarecords).s3).user | quote }}
  EMIRECORDS__MEDIARECORDS__S3__PASSWORD: {{ required "app.mediarecords.s3.password is required" (((.Values.app).mediarecords).s3).password | quote }}
