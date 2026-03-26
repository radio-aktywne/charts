apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "lotus.configMapMetadata" . | nindent 2 }}
data:
  LOTUS__APIS__ICANHAZDADJOKE__HOST: {{ required "lotus.apis.icanhazdadjoke.host is required" (((.Values.lotus).apis).icanhazdadjoke).host | quote }}
  LOTUS__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.lotus).apis).icanhazdadjoke).path | default "" | quote }}
  LOTUS__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.lotus).apis).icanhazdadjoke).port | int | default "" | quote }}
  LOTUS__APIS__ICANHAZDADJOKE__SCHEME: {{ required "lotus.apis.icanhazdadjoke.scheme is required" (((.Values.lotus).apis).icanhazdadjoke).scheme | quote }}
  LOTUS__APIS__PELICAN__HOST: {{ required "lotus.apis.pelican.host is required" (((.Values.lotus).apis).pelican).host | quote }}
  LOTUS__APIS__PELICAN__PATH: {{ (((.Values.lotus).apis).pelican).path | default "" | quote }}
  LOTUS__APIS__PELICAN__PORT: {{ (((.Values.lotus).apis).pelican).port | int | default "" | quote }}
  LOTUS__APIS__PELICAN__SCHEME: {{ required "lotus.apis.pelican.scheme is required" (((.Values.lotus).apis).pelican).scheme | quote }}
  LOTUS__DEBUG: {{ required "lotus.debug is required" (.Values.lotus).debug | quote }}
  LOTUS__SERVER__PORT: {{ required "lotus.server.port is required" ((.Values.lotus).server).port | int | quote }}
