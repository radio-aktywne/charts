apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "orchid.configMapMetadata" . | nindent 2 }}
data:
  ORCHID__SERVER__PORT: {{ required "orchid.server.port is required" ((.Values.orchid).server).port | int | quote }}
  ORCHID__URLS__PUBLIC: {{ required "orchid.urls.public is required" ((.Values.orchid).urls).public | quote }}
  ORCHID__FALCON__PUBLIC__SCHEME: {{ required "orchid.falcon.public.scheme is required" (((.Values.orchid).falcon).public).scheme | quote }}
  ORCHID__FALCON__PUBLIC__HOST: {{ required "orchid.falcon.public.host is required" (((.Values.orchid).falcon).public).host | quote }}
  ORCHID__FALCON__PUBLIC__PORT: {{ (((.Values.orchid).falcon).public).port | int | default "" | quote }}
  ORCHID__FALCON__PUBLIC__PATH: {{ (((.Values.orchid).falcon).public).path | default "" | quote }}
  ORCHID__CROCUS__PUBLIC__SCHEME: {{ required "orchid.crocus.public.scheme is required" (((.Values.orchid).crocus).public).scheme | quote }}
  ORCHID__CROCUS__PUBLIC__HOST: {{ required "orchid.crocus.public.host is required" (((.Values.orchid).crocus).public).host | quote }}
  ORCHID__CROCUS__PUBLIC__PORT: {{ (((.Values.orchid).crocus).public).port | int | default "" | quote }}
  ORCHID__CROCUS__PUBLIC__PATH: {{ (((.Values.orchid).crocus).public).path | default "" | quote }}
  ORCHID__OIDC__GOOGLE__DOMAIN: {{ (((.Values.orchid).oidc).google).domain | default "" | quote }}
