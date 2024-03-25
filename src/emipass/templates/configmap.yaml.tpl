apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emipass.configMapMetadata" . | nindent 2 }}
data:
  EMIPASS__SERVER__PORT: {{ required "app.ports.http is required" ((.Values.app).ports).http | int | quote }}
  EMIPASS__STREAMER__WHIP__PORTS: {{ required "app.ports.whip is required" ((.Values.app).ports).whip | int | quote }}
  EMIPASS__STREAMER__RTP__MIN: {{ required "app.ports.rtp is required" ((.Values.app).ports).rtp | int | quote }}
  EMIPASS__STREAMER__RTP__MAX: {{ required "app.ports.rtp is required" ((.Values.app).ports).rtp | int | quote }}
  EMIPASS__STREAMER__STUN__HOST: {{ required "app.streamer.stun.host is required" (((.Values.app).streamer).stun).host | quote }}
  EMIPASS__STREAMER__STUN__PORT: {{ required "app.streamer.stun.port is required" (((.Values.app).streamer).stun).port | int | quote }}
  EMIPASS__STREAMER__TIMEOUT: {{ required "app.streamer.timeout is required" ((.Values.app).streamer).timeout | quote }}
