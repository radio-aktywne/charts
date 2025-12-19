apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "daisy.configMapMetadata" . | nindent 2 }}
data:
  DAISY__DEBUG: {{ required "daisy.debug is required" (.Values.daisy).debug | quote }}
  DAISY__MANTIS__HTTP__HOST: {{ required "daisy.mantis.http.host is required" (((.Values.daisy).mantis).http).host | quote }}
  DAISY__MANTIS__HTTP__PATH: {{ (((.Values.daisy).mantis).http).path | default "" | quote }}
  DAISY__MANTIS__HTTP__PORT: {{ (((.Values.daisy).mantis).http).port | int | default "" | quote }}
  DAISY__MANTIS__HTTP__SCHEME: {{ required "daisy.mantis.http.scheme is required" (((.Values.daisy).mantis).http).scheme | quote }}
  DAISY__SCORPION__PUBLIC__HOST: {{ required "daisy.scorpion.public.host is required" (((.Values.daisy).scorpion).public).host | quote }}
  DAISY__SCORPION__PUBLIC__PATH: {{ (((.Values.daisy).scorpion).public).path | default "" | quote }}
  DAISY__SCORPION__PUBLIC__PORT: {{ (((.Values.daisy).scorpion).public).port | int | default "" | quote }}
  DAISY__SCORPION__PUBLIC__SCHEME: {{ required "daisy.scorpion.public.scheme is required" (((.Values.daisy).scorpion).public).scheme | quote }}
  DAISY__SERVER__PORT: {{ required "daisy.server.port is required" ((.Values.daisy).server).port | int | quote }}
  DAISY__URLS__PUBLIC: {{ required "daisy.urls.public is required" ((.Values.daisy).urls).public | quote }}
