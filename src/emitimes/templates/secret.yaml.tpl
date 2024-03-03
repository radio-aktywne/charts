apiVersion: v1
kind: Secret
metadata:
  {{- include "emitimes.secretMetadata" . | nindent 2 }}
stringData:
  EMITIMES_USER: {{ required "database.user is required" (.Values.database).user | quote }}
  EMITIMES_PASSWORD: {{ required "database.password is required" (.Values.database).password | quote }}
