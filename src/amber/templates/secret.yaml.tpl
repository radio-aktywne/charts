apiVersion: v1
kind: Secret
metadata:
  {{- include "amber.secretMetadata" . | nindent 2 }}
stringData:
  AMBER__CREDENTIALS__ADMIN__USER: {{ required "amber.credentials.admin.user is required" (((.Values.amber).credentials).admin).user | quote }}
  AMBER__CREDENTIALS__ADMIN__PASSWORD: {{ required "amber.credentials.admin.password is required" (((.Values.amber).credentials).admin).password | quote }}
  AMBER__CREDENTIALS__READONLY__USER: {{ required "amber.credentials.readonly.user is required" (((.Values.amber).credentials).readonly).user | quote }}
  AMBER__CREDENTIALS__READONLY__PASSWORD: {{ required "amber.credentials.readonly.password is required" (((.Values.amber).credentials).readonly).password | quote }}
  AMBER__CREDENTIALS__READWRITE__USER: {{ required "amber.credentials.readwrite.user is required" (((.Values.amber).credentials).readwrite).user | quote }}
  AMBER__CREDENTIALS__READWRITE__PASSWORD: {{ required "amber.credentials.readwrite.password is required" (((.Values.amber).credentials).readwrite).password | quote }}
