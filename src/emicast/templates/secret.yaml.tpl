apiVersion: v1
kind: Secret
metadata:
  {{- include "emicast.secretMetadata" . | nindent 2 }}
stringData:
  EMICAST__CREDENTIALS__SOURCE__USER: {{ required "app.credentials.source.user is required" (((.Values.app).credentials).source).user | quote }}
  EMICAST__CREDENTIALS__SOURCE__PASSWORD: {{ required "app.credentials.source.password is required" (((.Values.app).credentials).source).password | quote }}
  EMICAST__CREDENTIALS__ADMIN__USER: {{ required "app.credentials.admin.user is required" (((.Values.app).credentials).admin).user | quote }}
  EMICAST__CREDENTIALS__ADMIN__PASSWORD: {{ required "app.credentials.admin.password is required" (((.Values.app).credentials).admin).password | quote }}
