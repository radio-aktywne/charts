apiVersion: v1
kind: Secret
metadata:
  {{- include "emishows-db.secretMetadata" . | nindent 2 }}
stringData:
  EMISHOWS_DB_ROOT_PASSWORD: {{ required "database.credentials.root.password is required" (((.Values.database).credentials).root).password | quote }}
  EMISHOWS_DB_PASSWORD: {{ required "database.credentials.user.password is required" (((.Values.database).credentials).user).password | quote }}
