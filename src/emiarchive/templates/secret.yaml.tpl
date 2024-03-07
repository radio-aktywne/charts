apiVersion: v1
kind: Secret
metadata:
  {{- include "emiarchive.secretMetadata" . | nindent 2 }}
stringData:
  EMIARCHIVE_ADMIN_USER: {{ required "database.credentials.admin.user is required" (((.Values.database).credentials).admin).user | quote }}
  EMIARCHIVE_ADMIN_PASSWORD: {{ required "database.credentials.admin.password is required" (((.Values.database).credentials).admin).password | quote }}
  EMIARCHIVE_READONLY_USER: {{ required "database.credentials.readonly.user is required" (((.Values.database).credentials).readonly).user | quote }}
  EMIARCHIVE_READONLY_PASSWORD: {{ required "database.credentials.readonly.password is required" (((.Values.database).credentials).readonly).password | quote }}
  EMIARCHIVE_READWRITE_USER: {{ required "database.credentials.readwrite.user is required" (((.Values.database).credentials).readwrite).user | quote }}
  EMIARCHIVE_READWRITE_PASSWORD: {{ required "database.credentials.readwrite.password is required" (((.Values.database).credentials).readwrite).password | quote }}
