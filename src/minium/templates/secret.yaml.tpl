apiVersion: v1
kind: Secret
metadata:
  {{- include "minium.secretMetadata" . | nindent 2 }}
stringData:
  MINIUM__CREDENTIALS__ADMIN__USER: {{ required "minium.credentials.admin.user is required" (((.Values.minium).credentials).admin).user | quote }}
  MINIUM__CREDENTIALS__ADMIN__PASSWORD: {{ required "minium.credentials.admin.password is required" (((.Values.minium).credentials).admin).password | quote }}
  MINIUM__CREDENTIALS__READONLY__USER: {{ required "minium.credentials.readonly.user is required" (((.Values.minium).credentials).readonly).user | quote }}
  MINIUM__CREDENTIALS__READONLY__PASSWORD: {{ required "minium.credentials.readonly.password is required" (((.Values.minium).credentials).readonly).password | quote }}
  MINIUM__CREDENTIALS__READWRITE__USER: {{ required "minium.credentials.readwrite.user is required" (((.Values.minium).credentials).readwrite).user | quote }}
  MINIUM__CREDENTIALS__READWRITE__PASSWORD: {{ required "minium.credentials.readwrite.password is required" (((.Values.minium).credentials).readwrite).password | quote }}
