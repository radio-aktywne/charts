apiVersion: v1
kind: Secret
metadata:
  {{- include "emishows.secretMetadata" . | nindent 2 }}
stringData:
  EMISHOWS__DATABASE__PASSWORD: {{ required "app.database.password is required" ((.Values.app).database).password | quote }}
  EMISHOWS__EMITIMES__USER: {{ required "app.emitimes.user is required" ((.Values.app).emitimes).user | quote }}
  EMISHOWS__EMITIMES__PASSWORD: {{ required "app.emitimes.password is required" ((.Values.app).emitimes).password | quote }}
