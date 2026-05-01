apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "loris.configMapMetadata" . | nindent 2 }}
data:
  LORIS__DEBUG: {{ required "loris.debug is required" (.Values.loris).debug | quote }}
  LORIS__SERVER__PORTS__HTTP: {{ required "loris.server.ports.http is required" (((.Values.loris).server).ports).http | int | quote }}
  LORIS__SERVER__PORTS__RTP: {{ required "loris.server.ports.rtp is required" (((.Values.loris).server).ports).rtp | int | quote }}
  LORIS__SERVER__PORTS__WHIP: {{ required "loris.server.ports.whip is required" (((.Values.loris).server).ports).whip | int | quote }}
  LORIS__STREAMING__STUN__HOST: {{ required "loris.streaming.stun.host is required" (((.Values.loris).streaming).stun).host | quote }}
  LORIS__STREAMING__STUN__PORT: {{ required "loris.streaming.stun.port is required" (((.Values.loris).streaming).stun).port | int | quote }}
  LORIS__STREAMING__TIMEOUT: {{ required "loris.streaming.timeout is required" ((.Values.loris).streaming).timeout | quote }}
