apiVersion: v1
kind: Secret
metadata:
  {{- include "gecko.secretMetadata" . | nindent 2 }}
stringData:
  GECKO__EMERALD__S3__USER: {{ required "gecko.emerald.s3.user is required" (((.Values.gecko).emerald).s3).user | quote }}
  GECKO__EMERALD__S3__PASSWORD: {{ required "gecko.emerald.s3.password is required" (((.Values.gecko).emerald).s3).password | quote }}
