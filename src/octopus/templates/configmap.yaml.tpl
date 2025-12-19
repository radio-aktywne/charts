apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "octopus.configMapMetadata" . | nindent 2 }}
data:
  OCTOPUS__DEBUG: {{ required "octopus.debug is required" (.Values.octopus).debug | quote }}
  OCTOPUS__BEAVER__HTTP__HOST: {{ required "octopus.beaver.http.host is required" (((.Values.octopus).beaver).http).host | quote }}
  OCTOPUS__BEAVER__HTTP__PATH: {{ (((.Values.octopus).beaver).http).path | default "" | quote }}
  OCTOPUS__BEAVER__HTTP__PORT: {{ (((.Values.octopus).beaver).http).port | int | default "" | quote }}
  OCTOPUS__BEAVER__HTTP__SCHEME: {{ required "octopus.beaver.http.scheme is required" (((.Values.octopus).beaver).http).scheme | quote }}
  OCTOPUS__DINGO__SRT__HOST: {{ required "octopus.dingo.srt.host is required" (((.Values.octopus).dingo).srt).host | quote }}
  OCTOPUS__DINGO__SRT__PORT: {{ required "octopus.dingo.srt.port is required" (((.Values.octopus).dingo).srt).port | int | quote }}
  OCTOPUS__GECKO__HTTP__HOST: {{ required "octopus.gecko.http.host is required" (((.Values.octopus).gecko).http).host | quote }}
  OCTOPUS__GECKO__HTTP__PATH: {{ (((.Values.octopus).gecko).http).path | default "" | quote }}
  OCTOPUS__GECKO__HTTP__PORT: {{ (((.Values.octopus).gecko).http).port | int | default "" | quote }}
  OCTOPUS__GECKO__HTTP__SCHEME: {{ required "octopus.gecko.http.scheme is required" (((.Values.octopus).gecko).http).scheme | quote }}
  OCTOPUS__SERVER__PORTS__HTTP: {{ required "octopus.server.ports.http is required" (((.Values.octopus).server).ports).http | int | quote }}
  OCTOPUS__SERVER__PORTS__SRT: {{ required "octopus.server.ports.srt is required" (((.Values.octopus).server).ports).srt | int | quote }}
  OCTOPUS__STREAM__TIMEOUT: {{ required "octopus.stream.timeout is required" ((.Values.octopus).stream).timeout | quote }}
  OCTOPUS__STREAM__WINDOW: {{ required "octopus.stream.window is required" ((.Values.octopus).stream).window | quote }}
