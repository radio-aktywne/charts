apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emipass.configMapMetadata" . | nindent 2 }}
data:
  EMIPASS__SERVER__PORTS__HTTP: {{ required "app.server.ports.http is required" (((.Values.app).server).ports).http | int | quote }}
  EMIPASS__SERVER__PORTS__WHIP: {{ required "app.server.ports.whip is required" (((.Values.app).server).ports).whip | int | quote }}
  EMIPASS__SERVER__PORTS__RTP__MIN: {{ required "app.server.ports.rtp is required" (((.Values.app).server).ports).rtp | int | quote }}
  EMIPASS__SERVER__PORTS__RTP__MAX: {{ required "app.server.ports.rtp is required" (((.Values.app).server).ports).rtp | int | quote }}
  EMIPASS__STREAMER__STUN__HOST: {{ required "app.streamer.stun.host is required" (((.Values.app).streamer).stun).host | quote }}
  EMIPASS__STREAMER__STUN__PORT: {{ required "app.streamer.stun.port is required" (((.Values.app).streamer).stun).port | int | quote }}
  EMIPASS__STREAMER__TIMEOUT: {{ required "app.streamer.timeout is required" ((.Values.app).streamer).timeout | quote }}
