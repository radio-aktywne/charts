apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "fusion.configMapMetadata" . | nindent 2 }}
data:
  FUSION__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  FUSION__STREAMCAST__ICY__HOST: {{ required "app.streamcast.icy.host is required" (((.Values.app).streamcast).icy).host | quote }}
  FUSION__STREAMCAST__ICY__PORT: {{ required "app.streamcast.icy.port is required" (((.Values.app).streamcast).icy).port | int | quote }}
  FUSION__STREAMCAST__ICY__MOUNT: {{ required "app.streamcast.icy.mount is required" (((.Values.app).streamcast).icy).mount | quote }}
