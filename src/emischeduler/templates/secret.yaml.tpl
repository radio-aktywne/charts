apiVersion: v1
kind: Secret
metadata:
  {{- include "emischeduler.secretMetadata" . | nindent 2 }}
stringData:
  EMISCHEDULER__DATARECORDS__S3__USER: {{ required "app.datarecords.s3.user is required" (((.Values.app).datarecords).s3).user | quote }}
  EMISCHEDULER__DATARECORDS__S3__PASSWORD: {{ required "app.datarecords.s3.password is required" (((.Values.app).datarecords).s3).password | quote }}
