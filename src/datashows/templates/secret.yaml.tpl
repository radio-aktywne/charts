apiVersion: v1
kind: Secret
metadata:
  {{- include "datashows.secretMetadata" . | nindent 2 }}
stringData:
  DATASHOWS__CREDENTIALS__ROOT__PASSWORD: {{ required "database.credentials.root.password is required" (((.Values.database).credentials).root).password | quote }}
  DATASHOWS__CREDENTIALS__USER__PASSWORD: {{ required "database.credentials.user.password is required" (((.Values.database).credentials).user).password | quote }}
