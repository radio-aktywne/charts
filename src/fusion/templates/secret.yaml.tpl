apiVersion: v1
kind: Secret
metadata:
  {{- include "fusion.secretMetadata" . | nindent 2 }}
stringData:
  FUSION_STREAMCAST_USER: {{ required "app.streamcast.user is required" ((.Values.app).streamcast).user | quote }}
  FUSION_STREAMCAST_PASSWORD: {{ required "app.streamcast.password is required" ((.Values.app).streamcast).password | quote }}
