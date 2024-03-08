apiVersion: v1
kind: Secret
metadata:
  {{- include "emirecorder.secretMetadata" . | nindent 2 }}
stringData:
  EMIRECORDER__EMIARCHIVE__USER: {{ required "app.emiarchive.user is required" ((.Values.app).emiarchive).user | quote }}
  EMIRECORDER__EMIARCHIVE__PASSWORD: {{ required "app.emiarchive.password is required" ((.Values.app).emiarchive).password | quote }}
