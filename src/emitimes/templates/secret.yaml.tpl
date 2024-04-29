apiVersion: v1
kind: Secret
metadata:
  {{- include "emitimes.secretMetadata" . | nindent 2 }}
stringData:
  EMITIMES__CREDENTIALS__USER: {{ required "database.credentials.user is required" ((.Values.database).credentials).user | quote }}
  EMITIMES__CREDENTIALS__PASSWORD: {{ required "database.credentials.password is required" ((.Values.database).credentials).password | quote }}
