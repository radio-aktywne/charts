apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "loris.configMapMetadata" . | nindent 2 }}
data:
  LORIS__DEBUG: {{ required "loris.debug is required" (.Values.loris).debug | quote }}
  LORIS__SERVER__PORTS__HTTP: {{ required "loris.server.ports.http is required" (((.Values.loris).server).ports).http | int | quote }}
  LORIS__SERVER__PORTS__RTP__MAX: {{ required "loris.server.ports.rtp is required" (((.Values.loris).server).ports).rtp | int | quote }}
  LORIS__SERVER__PORTS__RTP__MIN: {{ required "loris.server.ports.rtp is required" (((.Values.loris).server).ports).rtp | int | quote }}
  LORIS__SERVER__PORTS__WHIP: {{ required "loris.server.ports.whip is required" (((.Values.loris).server).ports).whip | int | quote }}
  LORIS__STREAMER__STUN__HOST: {{ required "loris.streamer.stun.host is required" (((.Values.loris).streamer).stun).host | quote }}
  LORIS__STREAMER__STUN__PORT: {{ required "loris.streamer.stun.port is required" (((.Values.loris).streamer).stun).port | int | quote }}
  LORIS__STREAMER__TIMEOUT: {{ required "loris.streamer.timeout is required" ((.Values.loris).streamer).timeout | quote }}
