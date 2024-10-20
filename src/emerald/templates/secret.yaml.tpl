apiVersion: v1
kind: Secret
metadata:
  {{- include "emerald.secretMetadata" . | nindent 2 }}
stringData:
  EMERALD__CREDENTIALS__ADMIN__USER: {{ required "emerald.credentials.admin.user is required" (((.Values.emerald).credentials).admin).user | quote }}
  EMERALD__CREDENTIALS__ADMIN__PASSWORD: {{ required "emerald.credentials.admin.password is required" (((.Values.emerald).credentials).admin).password | quote }}
  EMERALD__CREDENTIALS__READONLY__USER: {{ required "emerald.credentials.readonly.user is required" (((.Values.emerald).credentials).readonly).user | quote }}
  EMERALD__CREDENTIALS__READONLY__PASSWORD: {{ required "emerald.credentials.readonly.password is required" (((.Values.emerald).credentials).readonly).password | quote }}
  EMERALD__CREDENTIALS__READWRITE__USER: {{ required "emerald.credentials.readwrite.user is required" (((.Values.emerald).credentials).readwrite).user | quote }}
  EMERALD__CREDENTIALS__READWRITE__PASSWORD: {{ required "emerald.credentials.readwrite.password is required" (((.Values.emerald).credentials).readwrite).password | quote }}
