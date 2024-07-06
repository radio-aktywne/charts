apiVersion: v1
kind: Secret
metadata:
  {{- include "datatunes.secretMetadata" . | nindent 2 }}
stringData:
  DATATUNES__CREDENTIALS__ADMIN__USER: {{ required "database.credentials.admin.user is required" (((.Values.database).credentials).admin).user | quote }}
  DATATUNES__CREDENTIALS__ADMIN__PASSWORD: {{ required "database.credentials.admin.password is required" (((.Values.database).credentials).admin).password | quote }}
  DATATUNES__CREDENTIALS__READONLY__USER: {{ required "database.credentials.readonly.user is required" (((.Values.database).credentials).readonly).user | quote }}
  DATATUNES__CREDENTIALS__READONLY__PASSWORD: {{ required "database.credentials.readonly.password is required" (((.Values.database).credentials).readonly).password | quote }}
  DATATUNES__CREDENTIALS__READWRITE__USER: {{ required "database.credentials.readwrite.user is required" (((.Values.database).credentials).readwrite).user | quote }}
  DATATUNES__CREDENTIALS__READWRITE__PASSWORD: {{ required "database.credentials.readwrite.password is required" (((.Values.database).credentials).readwrite).password | quote }}
