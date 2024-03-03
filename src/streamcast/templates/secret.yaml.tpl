apiVersion: v1
kind: Secret
metadata:
  {{- include "streamcast.secretMetadata" . | nindent 2 }}
stringData:
  STREAMCAST_SOURCE_USER: {{ required "app.source.user is required" (.Values.app).source.user | quote }}
  STREAMCAST_SOURCE_PASSWORD: {{ required "app.source.password is required" (.Values.app).source.password | quote }}
  STREAMCAST_ADMIN_USER: {{ required "app.admin.user is required" (.Values.app).admin.user | quote }}
  STREAMCAST_ADMIN_PASSWORD: {{ required "app.admin.password is required" (.Values.app).admin.password | quote }}
