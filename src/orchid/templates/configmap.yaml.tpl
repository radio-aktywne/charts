apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "orchid.configMapMetadata" . | nindent 2 }}
data:
  ORCHID__APIS__FALCON__HOST: {{ required "orchid.apis.falcon.host is required" (((.Values.orchid).apis).falcon).host | quote }}
  ORCHID__APIS__FALCON__PATH: {{ (((.Values.orchid).apis).falcon).path | default "" | quote }}
  ORCHID__APIS__FALCON__PORT: {{ (((.Values.orchid).apis).falcon).port | int | default "" | quote }}
  ORCHID__APIS__FALCON__SCHEME: {{ required "orchid.apis.falcon.scheme is required" (((.Values.orchid).apis).falcon).scheme | quote }}
  ORCHID__APIS__ICANHAZDADJOKE__HOST: {{ required "orchid.apis.icanhazdadjoke.host is required" (((.Values.orchid).apis).icanhazdadjoke).host | quote }}
  ORCHID__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.orchid).apis).icanhazdadjoke).path | default "" | quote }}
  ORCHID__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.orchid).apis).icanhazdadjoke).port | int | default "" | quote }}
  ORCHID__APIS__ICANHAZDADJOKE__SCHEME: {{ required "orchid.apis.icanhazdadjoke.scheme is required" (((.Values.orchid).apis).icanhazdadjoke).scheme | quote }}
  ORCHID__DEBUG: {{ required "orchid.debug is required" (.Values.orchid).debug | quote }}
  ORCHID__OIDC__GOOGLE__DOMAIN: {{ (((.Values.orchid).oidc).google).domain | default "" | quote }}
  ORCHID__SERVER__PORT: {{ required "orchid.server.port is required" ((.Values.orchid).server).port | int | quote }}
  ORCHID__URLS__CROCUS__HOST: {{ required "orchid.urls.crocus.host is required" (((.Values.orchid).urls).crocus).host | quote }}
  ORCHID__URLS__CROCUS__PATH: {{ (((.Values.orchid).urls).crocus).path | default "" | quote }}
  ORCHID__URLS__CROCUS__PORT: {{ (((.Values.orchid).urls).crocus).port | int | default "" | quote }}
  ORCHID__URLS__CROCUS__SCHEME: {{ required "orchid.urls.crocus.scheme is required" (((.Values.orchid).urls).crocus).scheme | quote }}
  ORCHID__URLS__FALCON__HOST: {{ required "orchid.urls.falcon.host is required" (((.Values.orchid).urls).falcon).host | quote }}
  ORCHID__URLS__FALCON__PATH: {{ (((.Values.orchid).urls).falcon).path | default "" | quote }}
  ORCHID__URLS__FALCON__PORT: {{ (((.Values.orchid).urls).falcon).port | int | default "" | quote }}
  ORCHID__URLS__FALCON__SCHEME: {{ required "orchid.urls.falcon.scheme is required" (((.Values.orchid).urls).falcon).scheme | quote }}
