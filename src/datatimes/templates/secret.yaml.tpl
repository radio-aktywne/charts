apiVersion: v1
kind: Secret
metadata:
  {{- include "datatimes.secretMetadata" . | nindent 2 }}
stringData:
  DATATIMES__CREDENTIALS__USER: {{ required "database.credentials.user is required" ((.Values.database).credentials).user | quote }}
  DATATIMES__CREDENTIALS__PASSWORD: {{ required "database.credentials.password is required" ((.Values.database).credentials).password | quote }}
