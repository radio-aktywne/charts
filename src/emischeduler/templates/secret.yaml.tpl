apiVersion: v1
kind: Secret
metadata:
  {{- include "emischeduler.secretMetadata" . | nindent 2 }}
stringData:
  EMISCHEDULER__EMIARCHIVE__USER: {{ required "app.emiarchive.user is required" ((.Values.app).emiarchive).user | quote }}
  EMISCHEDULER__EMIARCHIVE__PASSWORD: {{ required "app.emiarchive.password is required" ((.Values.app).emiarchive).password | quote }}
