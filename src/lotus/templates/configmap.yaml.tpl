apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "lotus.configMapMetadata" . | nindent 2 }}
data:
  LOTUS__SERVER__PORT: {{ required "lotus.server.port is required" ((.Values.lotus).server).port | int | quote }}
  {{- if ((.Values.lotus).cookies).domain }}
  LOTUS__COOKIES__DOMAIN: {{ .Values.lotus.cookies.domain | quote }}
  {{- end }}
  LOTUS__URLS__PUBLIC: {{ required "lotus.urls.public is required" ((.Values.lotus).urls).public | quote }}
  LOTUS__PELICAN__HTTP__SCHEME: {{ required "lotus.pelican.http.scheme is required" (((.Values.lotus).pelican).http).scheme | quote }}
  LOTUS__PELICAN__HTTP__HOST: {{ required "lotus.pelican.http.host is required" (((.Values.lotus).pelican).http).host | quote }}
  LOTUS__PELICAN__HTTP__PORT: {{ (((.Values.lotus).pelican).http).port | int | default "" | quote }}
  LOTUS__PELICAN__HTTP__PATH: {{ (((.Values.lotus).pelican).http).path | default "" | quote }}
  LOTUS__SCORPION__PUBLIC__SCHEME: {{ required "lotus.scorpion.public.scheme is required" (((.Values.lotus).scorpion).public).scheme | quote }}
  LOTUS__SCORPION__PUBLIC__HOST: {{ required "lotus.scorpion.public.host is required" (((.Values.lotus).scorpion).public).host | quote }}
  LOTUS__SCORPION__PUBLIC__PORT: {{ (((.Values.lotus).scorpion).public).port | int | default "" | quote }}
  LOTUS__SCORPION__PUBLIC__PATH: {{ (((.Values.lotus).scorpion).public).path | default "" | quote }}
  LOTUS__DEBUG: {{ required "lotus.debug is required" (.Values.lotus).debug | quote }}
