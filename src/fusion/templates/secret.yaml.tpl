apiVersion: v1
kind: Secret
metadata:
  {{- include "fusion.secretMetadata" . | nindent 2 }}
stringData:
  FUSION__EMICAST__ICY__USER: {{ required "app.emicast.icy.user is required" (((.Values.app).emicast).icy).user | quote }}
  FUSION__EMICAST__ICY__PASSWORD: {{ required "app.emicast.icy.password is required" (((.Values.app).emicast).icy).password | quote }}
