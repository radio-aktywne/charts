apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "poppy.configMapMetadata" . | nindent 2 }}
data:
  POPPY__SERVER__PORT: {{ required "poppy.server.port is required" ((.Values.poppy).server).port | int | quote }}
  POPPY__EVENTS__WINDOW: {{ required "poppy.events.window is required" ((.Values.poppy).events).window | quote }}
  POPPY__BEAVER__HTTP__SCHEME: {{ required "poppy.beaver.http.scheme is required" (((.Values.poppy).beaver).http).scheme | quote }}
  POPPY__BEAVER__HTTP__HOST: {{ required "poppy.beaver.http.host is required" (((.Values.poppy).beaver).http).host | quote }}
  POPPY__BEAVER__HTTP__PORT: {{ required "poppy.beaver.http.port is required" (((.Values.poppy).beaver).http).port | int | quote }}
  {{- if (((.Values.poppy).beaver).http).path }}
  POPPY__BEAVER__HTTP__PATH: {{ .Values.poppy.beaver.http.path | quote }}
  {{- end }}
  POPPY__LORIS__HTTP__SCHEME: {{ required "poppy.loris.http.scheme is required" (((.Values.poppy).loris).http).scheme | quote }}
  POPPY__LORIS__HTTP__HOST: {{ required "poppy.loris.http.host is required" (((.Values.poppy).loris).http).host | quote }}
  POPPY__LORIS__HTTP__PORT: {{ required "poppy.loris.http.port is required" (((.Values.poppy).loris).http).port | int | quote }}
  {{- if (((.Values.poppy).loris).http).path }}
  POPPY__LORIS__HTTP__PATH: {{ .Values.poppy.loris.http.path | quote }}
  {{- end }}
  POPPY__LORIS__WHIP__SCHEME: {{ required "poppy.loris.whip.scheme is required" (((.Values.poppy).loris).whip).scheme | quote }}
  POPPY__LORIS__WHIP__HOST: {{ required "poppy.loris.whip.host is required" (((.Values.poppy).loris).whip).host | quote }}
  POPPY__LORIS__WHIP__PORT: {{ required "poppy.loris.whip.port is required" (((.Values.poppy).loris).whip).port | int | quote }}
  {{- if (((.Values.poppy).loris).whip).path }}
  POPPY__LORIS__WHIP__PATH: {{ .Values.poppy.loris.whip.path | quote }}
  {{- end }}
  POPPY__OCTOPUS__HTTP__SCHEME: {{ required "poppy.octopus.http.scheme is required" (((.Values.poppy).octopus).http).scheme | quote }}
  POPPY__OCTOPUS__HTTP__HOST: {{ required "poppy.octopus.http.host is required" (((.Values.poppy).octopus).http).host | quote }}
  POPPY__OCTOPUS__HTTP__PORT: {{ required "poppy.octopus.http.port is required" (((.Values.poppy).octopus).http).port | int | quote }}
  {{- if (((.Values.poppy).octopus).http).path }}
  POPPY__OCTOPUS__HTTP__PATH: {{ .Values.poppy.octopus.http.path | quote }}
  {{- end }}
  POPPY__OCTOPUS__SRT__HOST: {{ required "poppy.octopus.srt.host is required" (((.Values.poppy).octopus).srt).host | quote }}
  POPPY__OCTOPUS__SRT__PORT: {{ required "poppy.octopus.srt.port is required" (((.Values.poppy).octopus).srt).port | int | quote }}
