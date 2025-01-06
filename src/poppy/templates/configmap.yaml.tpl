apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "poppy.configMapMetadata" . | nindent 2 }}
data:
  POPPY__SERVER__PORT: {{ required "poppy.server.port is required" ((.Values.poppy).server).port | int | quote }}
  {{- if ((.Values.poppy).cookies).domain }}
  POPPY__COOKIES__DOMAIN: {{ .Values.poppy.cookies.domain | quote }}
  {{- end }}
  POPPY__URLS__PUBLIC: {{ required "poppy.urls.public is required" ((.Values.poppy).urls).public | quote }}
  POPPY__BEAVER__HTTP__SCHEME: {{ required "poppy.beaver.http.scheme is required" (((.Values.poppy).beaver).http).scheme | quote }}
  POPPY__BEAVER__HTTP__HOST: {{ required "poppy.beaver.http.host is required" (((.Values.poppy).beaver).http).host | quote }}
  POPPY__BEAVER__HTTP__PORT: {{ (((.Values.poppy).beaver).http).port | int | default "" | quote }}
  POPPY__BEAVER__HTTP__PATH: {{ (((.Values.poppy).beaver).http).path | default "" | quote }}
  POPPY__LORIS__HTTP__SCHEME: {{ required "poppy.loris.http.scheme is required" (((.Values.poppy).loris).http).scheme | quote }}
  POPPY__LORIS__HTTP__HOST: {{ required "poppy.loris.http.host is required" (((.Values.poppy).loris).http).host | quote }}
  POPPY__LORIS__HTTP__PORT: {{ (((.Values.poppy).loris).http).port | int | default "" | quote }}
  POPPY__LORIS__HTTP__PATH: {{ (((.Values.poppy).loris).http).path | default "" | quote }}
  POPPY__LORIS__WHIP__SCHEME: {{ required "poppy.loris.whip.scheme is required" (((.Values.poppy).loris).whip).scheme | quote }}
  POPPY__LORIS__WHIP__HOST: {{ required "poppy.loris.whip.host is required" (((.Values.poppy).loris).whip).host | quote }}
  POPPY__LORIS__WHIP__PORT: {{ (((.Values.poppy).loris).whip).port | int | default "" | quote }}
  POPPY__LORIS__WHIP__PATH: {{ (((.Values.poppy).loris).whip).path | default "" | quote }}
  POPPY__OCTOPUS__HTTP__SCHEME: {{ required "poppy.octopus.http.scheme is required" (((.Values.poppy).octopus).http).scheme | quote }}
  POPPY__OCTOPUS__HTTP__HOST: {{ required "poppy.octopus.http.host is required" (((.Values.poppy).octopus).http).host | quote }}
  POPPY__OCTOPUS__HTTP__PORT: {{ (((.Values.poppy).octopus).http).port | int | default "" | quote }}
  POPPY__OCTOPUS__HTTP__PATH: {{ (((.Values.poppy).octopus).http).path | default "" | quote }}
  POPPY__OCTOPUS__SRT__HOST: {{ required "poppy.octopus.srt.host is required" (((.Values.poppy).octopus).srt).host | quote }}
  POPPY__OCTOPUS__SRT__PORT: {{ required "poppy.octopus.srt.port is required" (((.Values.poppy).octopus).srt).port | int | quote }}
  POPPY__SCORPION__PUBLIC__SCHEME: {{ required "poppy.scorpion.public.scheme is required" (((.Values.poppy).scorpion).public).scheme | quote }}
  POPPY__SCORPION__PUBLIC__HOST: {{ required "poppy.scorpion.public.host is required" (((.Values.poppy).scorpion).public).host | quote }}
  POPPY__SCORPION__PUBLIC__PORT: {{ (((.Values.poppy).scorpion).public).port | int | default "" | quote }}
  POPPY__SCORPION__PUBLIC__PATH: {{ (((.Values.poppy).scorpion).public).path | default "" | quote }}
  POPPY__DEBUG: {{ required "poppy.debug is required" (.Values.poppy).debug | quote }}
