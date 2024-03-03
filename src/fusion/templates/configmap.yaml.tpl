apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "fusion.configMapMetadata" . | nindent 2 }}
data:
  FUSION_PORT: {{ required "app.port is required" (.Values.app).port | int | quote }}
  FUSION_STREAMCAST_HOST: {{ required "app.streamcast.host is required" ((.Values.app).streamcast).host | quote }}
  FUSION_STREAMCAST_PORT: {{ required "app.streamcast.port is required" ((.Values.app).streamcast).port | int | quote }}
  FUSION_STREAMCAST_MOUNT: {{ required "app.streamcast.mount is required" ((.Values.app).streamcast).mount | quote }}
