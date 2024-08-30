apiVersion: v1
kind: Secret
metadata:
  {{- include "emilounge.secretMetadata" . | nindent 2 }}
stringData:
  EMILOUNGE__MEDIALOUNGE__S3__USER: {{ required "app.medialounge.s3.user is required" (((.Values.app).medialounge).s3).user | quote }}
  EMILOUNGE__MEDIALOUNGE__S3__PASSWORD: {{ required "app.medialounge.s3.password is required" (((.Values.app).medialounge).s3).password | quote }}
