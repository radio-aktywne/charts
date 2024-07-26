apiVersion: v1
kind: Secret
metadata:
  {{- include "emifuse.secretMetadata" . | nindent 2 }}
stringData:
  EMIFUSE__EMICAST__ICY__USER: {{ required "app.emicast.icy.user is required" (((.Values.app).emicast).icy).user | quote }}
  EMIFUSE__EMICAST__ICY__PASSWORD: {{ required "app.emicast.icy.password is required" (((.Values.app).emicast).icy).password | quote }}
