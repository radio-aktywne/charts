apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "jasmine.configMapMetadata" . | nindent 2 }}
data:
  JASMINE__APIS__BEAVER__HOST: {{ required "jasmine.apis.beaver.host is required" (((.Values.jasmine).apis).beaver).host | quote }}
  JASMINE__APIS__BEAVER__PATH: {{ (((.Values.jasmine).apis).beaver).path | default "" | quote }}
  JASMINE__APIS__BEAVER__PORT: {{ (((.Values.jasmine).apis).beaver).port | int | default "" | quote }}
  JASMINE__APIS__BEAVER__SCHEME: {{ required "jasmine.apis.beaver.scheme is required" (((.Values.jasmine).apis).beaver).scheme | quote }}
  JASMINE__APIS__ICANHAZDADJOKE__HOST: {{ required "jasmine.apis.icanhazdadjoke.host is required" (((.Values.jasmine).apis).icanhazdadjoke).host | quote }}
  JASMINE__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.jasmine).apis).icanhazdadjoke).path | default "" | quote }}
  JASMINE__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.jasmine).apis).icanhazdadjoke).port | int | default "" | quote }}
  JASMINE__APIS__ICANHAZDADJOKE__SCHEME: {{ required "jasmine.apis.icanhazdadjoke.scheme is required" (((.Values.jasmine).apis).icanhazdadjoke).scheme | quote }}
  JASMINE__APIS__NUMBAT__HOST: {{ required "jasmine.apis.numbat.host is required" (((.Values.jasmine).apis).numbat).host | quote }}
  JASMINE__APIS__NUMBAT__PATH: {{ (((.Values.jasmine).apis).numbat).path | default "" | quote }}
  JASMINE__APIS__NUMBAT__PORT: {{ (((.Values.jasmine).apis).numbat).port | int | default "" | quote }}
  JASMINE__APIS__NUMBAT__SCHEME: {{ required "jasmine.apis.numbat.scheme is required" (((.Values.jasmine).apis).numbat).scheme | quote }}
  JASMINE__DEBUG: {{ required "jasmine.debug is required" (.Values.jasmine).debug | quote }}
  JASMINE__SERVER__PORT: {{ required "jasmine.server.port is required" ((.Values.jasmine).server).port | int | quote }}
