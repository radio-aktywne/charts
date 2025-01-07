apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "tulip.configMapMetadata" . | nindent 2 }}
data:
  TULIP__SERVER__PORT: {{ required "tulip.server.port is required" ((.Values.tulip).server).port | int | quote }}
  TULIP__URLS__PUBLIC: {{ required "tulip.urls.public is required" ((.Values.tulip).urls).public | quote }}
  TULIP__BEAVER__HTTP__SCHEME: {{ required "tulip.beaver.http.scheme is required" (((.Values.tulip).beaver).http).scheme | quote }}
  TULIP__BEAVER__HTTP__HOST: {{ required "tulip.beaver.http.host is required" (((.Values.tulip).beaver).http).host | quote }}
  TULIP__BEAVER__HTTP__PORT: {{ (((.Values.tulip).beaver).http).port | int | default "" | quote }}
  TULIP__BEAVER__HTTP__PATH: {{ (((.Values.tulip).beaver).http).path | default "" | quote }}
  TULIP__SCORPION__PUBLIC__SCHEME: {{ required "tulip.scorpion.public.scheme is required" (((.Values.tulip).scorpion).public).scheme | quote }}
  TULIP__SCORPION__PUBLIC__HOST: {{ required "tulip.scorpion.public.host is required" (((.Values.tulip).scorpion).public).host | quote }}
  TULIP__SCORPION__PUBLIC__PORT: {{ (((.Values.tulip).scorpion).public).port | int | default "" | quote }}
  TULIP__SCORPION__PUBLIC__PATH: {{ (((.Values.tulip).scorpion).public).path | default "" | quote }}
  TULIP__DEBUG: {{ required "tulip.debug is required" (.Values.tulip).debug | quote }}
