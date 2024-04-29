apiVersion: v1
kind: Secret
metadata:
  {{- include "fusion.secretMetadata" . | nindent 2 }}
stringData:
  FUSION__STREAMCAST__ICY__USER: {{ required "app.streamcast.icy.user is required" (((.Values.app).streamcast).icy).user | quote }}
  FUSION__STREAMCAST__ICY__PASSWORD: {{ required "app.streamcast.icy.password is required" (((.Values.app).streamcast).icy).password | quote }}
