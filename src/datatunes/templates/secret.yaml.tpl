apiVersion: v1
kind: Secret
metadata:
  {{- include "datatunes.secretMetadata" . | nindent 2 }}
stringData:
  DATATUNES__CREDENTIALS__ROOT__PASSWORD: {{ required "database.credentials.root.password is required" (((.Values.database).credentials).root).password | quote }}
  DATATUNES__CREDENTIALS__USER__PASSWORD: {{ required "database.credentials.user.password is required" (((.Values.database).credentials).user).password | quote }}
