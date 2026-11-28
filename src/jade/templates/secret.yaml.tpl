apiVersion: v1
kind: Secret
metadata:
  {{- include "jade.secretMetadata" . | nindent 2 }}
stringData:
  JADE__CREDENTIALS__ADMIN__PASSWORD: {{ required "jade.credentials.admin.password is required" (((.Values.jade).credentials).admin).password | quote }}
  JADE__CREDENTIALS__ADMIN__USER: {{ required "jade.credentials.admin.user is required" (((.Values.jade).credentials).admin).user | quote }}
  JADE__CREDENTIALS__READONLY__PASSWORD: {{ required "jade.credentials.readonly.password is required" (((.Values.jade).credentials).readonly).password | quote }}
  JADE__CREDENTIALS__READONLY__USER: {{ required "jade.credentials.readonly.user is required" (((.Values.jade).credentials).readonly).user | quote }}
  JADE__CREDENTIALS__READWRITE__PASSWORD: {{ required "jade.credentials.readwrite.password is required" (((.Values.jade).credentials).readwrite).password | quote }}
  JADE__CREDENTIALS__READWRITE__USER: {{ required "jade.credentials.readwrite.user is required" (((.Values.jade).credentials).readwrite).user | quote }}
