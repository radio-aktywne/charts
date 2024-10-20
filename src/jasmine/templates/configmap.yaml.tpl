apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "jasmine.configMapMetadata" . | nindent 2 }}
data:
  JASMINE__SERVER__PORT: {{ required "jasmine.server.port is required" ((.Values.jasmine).server).port | int | quote }}
  JASMINE__BEAVER__HTTP__SCHEME: {{ required "jasmine.beaver.http.scheme is required" (((.Values.jasmine).beaver).http).scheme | quote }}
  JASMINE__BEAVER__HTTP__HOST: {{ required "jasmine.beaver.http.host is required" (((.Values.jasmine).beaver).http).host | quote }}
  JASMINE__BEAVER__HTTP__PORT: {{ required "jasmine.beaver.http.port is required" (((.Values.jasmine).beaver).http).port | int | quote }}
  {{- if (((.Values.jasmine).beaver).http).path }}
  JASMINE__BEAVER__HTTP__PATH: {{ .Values.jasmine.beaver.http.path | quote }}
  {{- end }}
  JASMINE__NUMBAT__HTTP__SCHEME: {{ required "jasmine.numbat.http.scheme is required" (((.Values.jasmine).numbat).http).scheme | quote }}
  JASMINE__NUMBAT__HTTP__HOST: {{ required "jasmine.numbat.http.host is required" (((.Values.jasmine).numbat).http).host | quote }}
  JASMINE__NUMBAT__HTTP__PORT: {{ required "jasmine.numbat.http.port is required" (((.Values.jasmine).numbat).http).port | int | quote }}
  {{- if (((.Values.jasmine).numbat).http).path }}
  JASMINE__NUMBAT__HTTP__PATH: {{ .Values.jasmine.numbat.http.path | quote }}
  {{- end }}
