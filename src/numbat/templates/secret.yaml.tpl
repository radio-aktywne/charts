apiVersion: v1
kind: Secret
metadata:
  {{- include "numbat.secretMetadata" . | nindent 2 }}
stringData:
  NUMBAT__AMBER__S3__USER: {{ required "numbat.amber.s3.user is required" (((.Values.numbat).amber).s3).user | quote }}
  NUMBAT__AMBER__S3__PASSWORD: {{ required "numbat.amber.s3.password is required" (((.Values.numbat).amber).s3).password | quote }}
