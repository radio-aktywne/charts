apiVersion: v1
kind: Secret
metadata:
  {{- include "zircon.secretMetadata" . | nindent 2 }}
stringData:
  ZIRCON__CREDENTIALS__USER__PASSWORD: {{ required "zircon.credentials.user.password is required" (((.Values.zircon).credentials).user).password | quote }}
