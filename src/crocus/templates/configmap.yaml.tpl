apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "crocus.configMapMetadata" . | nindent 2 }}
data:
  CROCUS__APIS__ICANHAZDADJOKE__HOST: {{ required "crocus.apis.icanhazdadjoke.host is required" (((.Values.crocus).apis).icanhazdadjoke).host | quote }}
  CROCUS__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.crocus).apis).icanhazdadjoke).path | default "" | quote }}
  CROCUS__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.crocus).apis).icanhazdadjoke).port | int | default "" | quote }}
  CROCUS__APIS__ICANHAZDADJOKE__SCHEME: {{ required "crocus.apis.icanhazdadjoke.scheme is required" (((.Values.crocus).apis).icanhazdadjoke).scheme | quote }}
  CROCUS__APIS__SCORPION__HOST: {{ required "crocus.apis.scorpion.host is required" (((.Values.crocus).apis).scorpion).host | quote }}
  CROCUS__APIS__SCORPION__PATH: {{ (((.Values.crocus).apis).scorpion).path | default "" | quote }}
  CROCUS__APIS__SCORPION__PORT: {{ (((.Values.crocus).apis).scorpion).port | int | default "" | quote }}
  CROCUS__APIS__SCORPION__SCHEME: {{ required "crocus.apis.scorpion.scheme is required" (((.Values.crocus).apis).scorpion).scheme | quote }}
  CROCUS__DEBUG: {{ required "crocus.debug is required" (.Values.crocus).debug | quote }}
  CROCUS__SERVER__PORT: {{ required "crocus.server.port is required" ((.Values.crocus).server).port | int | quote }}
  CROCUS__URLS__ORCHID__HOST: {{ required "crocus.urls.orchid.host is required" (((.Values.crocus).urls).orchid).host | quote }}
  CROCUS__URLS__ORCHID__PATH: {{ (((.Values.crocus).urls).orchid).path | default "" | quote }}
  CROCUS__URLS__ORCHID__PORT: {{ (((.Values.crocus).urls).orchid).port | int | default "" | quote }}
  CROCUS__URLS__ORCHID__SCHEME: {{ required "crocus.urls.orchid.scheme is required" (((.Values.crocus).urls).orchid).scheme | quote }}
