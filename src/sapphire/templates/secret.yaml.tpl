apiVersion: v1
kind: Secret
metadata:
  {{- include "sapphire.secretMetadata" . | nindent 2 }}
stringData:
  SAPPHIRE__CREDENTIALS__USER__PASSWORD: {{ required "sapphire.credentials.user.password is required" (((.Values.sapphire).credentials).user).password | quote }}
