apiVersion: v1
kind: Secret
metadata:
  {{- include "howlite.secretMetadata" . | nindent 2 }}
stringData:
  HOWLITE__CREDENTIALS__PASSWORD: {{ required "howlite.credentials.password is required" ((.Values.howlite).credentials).password | quote }}
  HOWLITE__CREDENTIALS__USER: {{ required "howlite.credentials.user is required" ((.Values.howlite).credentials).user | quote }}
