apiVersion: v1
kind: Secret
metadata:
  {{- include "datarecords.secretMetadata" . | nindent 2 }}
stringData:
  DATARECORDS__CREDENTIALS__ADMIN__USER: {{ required "database.credentials.admin.user is required" (((.Values.database).credentials).admin).user | quote }}
  DATARECORDS__CREDENTIALS__ADMIN__PASSWORD: {{ required "database.credentials.admin.password is required" (((.Values.database).credentials).admin).password | quote }}
  DATARECORDS__CREDENTIALS__READONLY__USER: {{ required "database.credentials.readonly.user is required" (((.Values.database).credentials).readonly).user | quote }}
  DATARECORDS__CREDENTIALS__READONLY__PASSWORD: {{ required "database.credentials.readonly.password is required" (((.Values.database).credentials).readonly).password | quote }}
  DATARECORDS__CREDENTIALS__READWRITE__USER: {{ required "database.credentials.readwrite.user is required" (((.Values.database).credentials).readwrite).user | quote }}
  DATARECORDS__CREDENTIALS__READWRITE__PASSWORD: {{ required "database.credentials.readwrite.password is required" (((.Values.database).credentials).readwrite).password | quote }}
