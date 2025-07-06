apiVersion: v1
kind: Secret
metadata:
  {{- include "diamond.secretMetadata" . | nindent 2 }}
stringData:
  DIAMOND__CREDENTIALS__USER__PASSWORD: {{ required "diamond.credentials.user.password is required" (((.Values.diamond).credentials).user).password | quote }}
