apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "poppy.configMapMetadata" . | nindent 2 }}
data:
  POPPY__APIS__BEAVER__HOST: {{ required "poppy.apis.beaver.host is required" (((.Values.poppy).apis).beaver).host | quote }}
  POPPY__APIS__BEAVER__PATH: {{ (((.Values.poppy).apis).beaver).path | default "" | quote }}
  POPPY__APIS__BEAVER__PORT: {{ (((.Values.poppy).apis).beaver).port | int | default "" | quote }}
  POPPY__APIS__BEAVER__SCHEME: {{ required "poppy.apis.beaver.scheme is required" (((.Values.poppy).apis).beaver).scheme | quote }}
  POPPY__APIS__ICANHAZDADJOKE__HOST: {{ required "poppy.apis.icanhazdadjoke.host is required" (((.Values.poppy).apis).icanhazdadjoke).host | quote }}
  POPPY__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.poppy).apis).icanhazdadjoke).path | default "" | quote }}
  POPPY__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.poppy).apis).icanhazdadjoke).port | int | default "" | quote }}
  POPPY__APIS__ICANHAZDADJOKE__SCHEME: {{ required "poppy.apis.icanhazdadjoke.scheme is required" (((.Values.poppy).apis).icanhazdadjoke).scheme | quote }}
  POPPY__APIS__LORIS__HOST: {{ required "poppy.apis.loris.host is required" (((.Values.poppy).apis).loris).host | quote }}
  POPPY__APIS__LORIS__PATH: {{ (((.Values.poppy).apis).loris).path | default "" | quote }}
  POPPY__APIS__LORIS__PORT: {{ (((.Values.poppy).apis).loris).port | int | default "" | quote }}
  POPPY__APIS__LORIS__SCHEME: {{ required "poppy.apis.loris.scheme is required" (((.Values.poppy).apis).loris).scheme | quote }}
  POPPY__APIS__OCTOPUS__HOST: {{ required "poppy.apis.octopus.host is required" (((.Values.poppy).apis).octopus).host | quote }}
  POPPY__APIS__OCTOPUS__PATH: {{ (((.Values.poppy).apis).octopus).path | default "" | quote }}
  POPPY__APIS__OCTOPUS__PORT: {{ (((.Values.poppy).apis).octopus).port | int | default "" | quote }}
  POPPY__APIS__OCTOPUS__SCHEME: {{ required "poppy.apis.octopus.scheme is required" (((.Values.poppy).apis).octopus).scheme | quote }}
  POPPY__APIS__WHIP__HOST: {{ required "poppy.apis.whip.host is required" (((.Values.poppy).apis).whip).host | quote }}
  POPPY__APIS__WHIP__PATH: {{ (((.Values.poppy).apis).whip).path | default "" | quote }}
  POPPY__APIS__WHIP__PORT: {{ (((.Values.poppy).apis).whip).port | int | default "" | quote }}
  POPPY__APIS__WHIP__SCHEME: {{ required "poppy.apis.whip.scheme is required" (((.Values.poppy).apis).whip).scheme | quote }}
  POPPY__DEBUG: {{ required "poppy.debug is required" (.Values.poppy).debug | quote }}
  POPPY__SERVER__PORT: {{ required "poppy.server.port is required" ((.Values.poppy).server).port | int | quote }}
  POPPY__SRT__OCTOPUS__HOST: {{ required "poppy.srt.octopus.host is required" (((.Values.poppy).srt).octopus).host | quote }}
  POPPY__SRT__OCTOPUS__PORT: {{ required "poppy.srt.octopus.port is required" (((.Values.poppy).srt).octopus).port | int | quote }}
