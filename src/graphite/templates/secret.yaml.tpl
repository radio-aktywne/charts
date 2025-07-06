apiVersion: v1
kind: Secret
metadata:
  {{- include "graphite.secretMetadata" . | nindent 2 }}
stringData:
  GRAPHITE__CREDENTIALS__USER__PASSWORD: {{ required "graphite.credentials.user.password is required" (((.Values.graphite).credentials).user).password | quote }}
