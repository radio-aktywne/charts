apiVersion: v1
kind: Secret
metadata:
  {{- include "emishows-db.secretMetadata" . | nindent 2 }}
stringData:
  EMISHOWS_DB__CREDENTIALS__ROOT__PASSWORD: {{ required "database.credentials.root.password is required" (((.Values.database).credentials).root).password | quote }}
  EMISHOWS_DB__CREDENTIALS__USER__PASSWORD: {{ required "database.credentials.user.password is required" (((.Values.database).credentials).user).password | quote }}
