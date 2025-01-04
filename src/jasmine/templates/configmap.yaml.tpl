apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "jasmine.configMapMetadata" . | nindent 2 }}
data:
  JASMINE__SERVER__PORT: {{ required "jasmine.server.port is required" ((.Values.jasmine).server).port | int | quote }}
  {{- if ((.Values.jasmine).cookies).domain }}
  JASMINE__COOKIES__DOMAIN: {{ .Values.jasmine.cookies.domain | quote }}
  {{- end }}
  JASMINE__URLS__PUBLIC: {{ required "jasmine.urls.public is required" ((.Values.jasmine).urls).public | quote }}
  JASMINE__BEAVER__HTTP__SCHEME: {{ required "jasmine.beaver.http.scheme is required" (((.Values.jasmine).beaver).http).scheme | quote }}
  JASMINE__BEAVER__HTTP__HOST: {{ required "jasmine.beaver.http.host is required" (((.Values.jasmine).beaver).http).host | quote }}
  JASMINE__BEAVER__HTTP__PORT: {{ (((.Values.jasmine).beaver).http).port | int | default "" | quote }}
  JASMINE__BEAVER__HTTP__PATH: {{ (((.Values.jasmine).beaver).http).path | default "" | quote }}
  JASMINE__NUMBAT__HTTP__SCHEME: {{ required "jasmine.numbat.http.scheme is required" (((.Values.jasmine).numbat).http).scheme | quote }}
  JASMINE__NUMBAT__HTTP__HOST: {{ required "jasmine.numbat.http.host is required" (((.Values.jasmine).numbat).http).host | quote }}
  JASMINE__NUMBAT__HTTP__PORT: {{ (((.Values.jasmine).numbat).http).port | int | default "" | quote }}
  JASMINE__NUMBAT__HTTP__PATH: {{ (((.Values.jasmine).numbat).http).path | default "" | quote }}
  JASMINE__SCORPION__PUBLIC__SCHEME: {{ required "jasmine.scorpion.public.scheme is required" (((.Values.jasmine).scorpion).public).scheme | quote }}
  JASMINE__SCORPION__PUBLIC__HOST: {{ required "jasmine.scorpion.public.host is required" (((.Values.jasmine).scorpion).public).host | quote }}
  JASMINE__SCORPION__PUBLIC__PORT: {{ (((.Values.jasmine).scorpion).public).port | int | default "" | quote }}
  JASMINE__SCORPION__PUBLIC__PATH: {{ (((.Values.jasmine).scorpion).public).path | default "" | quote }}
  JASMINE__DEBUG: {{ required "jasmine.debug is required" (.Values.jasmine).debug | quote }}
