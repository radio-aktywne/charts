apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "daisy.configMapMetadata" . | nindent 2 }}
data:
  DAISY__APIS__ICANHAZDADJOKE__HOST: {{ required "daisy.apis.icanhazdadjoke.host is required" (((.Values.daisy).apis).icanhazdadjoke).host | quote }}
  DAISY__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.daisy).apis).icanhazdadjoke).path | default "" | quote }}
  DAISY__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.daisy).apis).icanhazdadjoke).port | int | default "" | quote }}
  DAISY__APIS__ICANHAZDADJOKE__SCHEME: {{ required "daisy.apis.icanhazdadjoke.scheme is required" (((.Values.daisy).apis).icanhazdadjoke).scheme | quote }}
  DAISY__APIS__MANTIS__HOST: {{ required "daisy.apis.mantis.host is required" (((.Values.daisy).apis).mantis).host | quote }}
  DAISY__APIS__MANTIS__PATH: {{ (((.Values.daisy).apis).mantis).path | default "" | quote }}
  DAISY__APIS__MANTIS__PORT: {{ (((.Values.daisy).apis).mantis).port | int | default "" | quote }}
  DAISY__APIS__MANTIS__SCHEME: {{ required "daisy.apis.mantis.scheme is required" (((.Values.daisy).apis).mantis).scheme | quote }}
  DAISY__DEBUG: {{ required "daisy.debug is required" (.Values.daisy).debug | quote }}
  DAISY__SERVER__PORT: {{ required "daisy.server.port is required" ((.Values.daisy).server).port | int | quote }}
