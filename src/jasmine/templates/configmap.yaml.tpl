apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "jasmine.configMapMetadata" . | nindent 2 }}
data:
  JASMINE__SERVER__PORT: {{ required "jasmine.server.port is required" ((.Values.jasmine).server).port | int | quote }}
  JASMINE__BEAVER__HTTP__SCHEME: {{ required "jasmine.beaver.http.scheme is required" (((.Values.jasmine).beaver).http).scheme | quote }}
  JASMINE__BEAVER__HTTP__HOST: {{ required "jasmine.beaver.http.host is required" (((.Values.jasmine).beaver).http).host | quote }}
  JASMINE__BEAVER__HTTP__PORT: {{ (((.Values.jasmine).beaver).http).port | int | default "" | quote }}
  JASMINE__BEAVER__HTTP__PATH: {{ (((.Values.jasmine).beaver).http).path | default "" | quote }}
  JASMINE__NUMBAT__HTTP__SCHEME: {{ required "jasmine.numbat.http.scheme is required" (((.Values.jasmine).numbat).http).scheme | quote }}
  JASMINE__NUMBAT__HTTP__HOST: {{ required "jasmine.numbat.http.host is required" (((.Values.jasmine).numbat).http).host | quote }}
  JASMINE__NUMBAT__HTTP__PORT: {{ (((.Values.jasmine).numbat).http).port | int | default "" | quote }}
  JASMINE__NUMBAT__HTTP__PATH: {{ (((.Values.jasmine).numbat).http).path | default "" | quote }}
