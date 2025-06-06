apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "crocus.configMapMetadata" . | nindent 2 }}
data:
  CROCUS__SERVER__PORT: {{ required "crocus.server.port is required" ((.Values.crocus).server).port | int | quote }}
  CROCUS__SCORPION__ADMIN__SCHEME: {{ required "crocus.scorpion.admin.scheme is required" (((.Values.crocus).scorpion).admin).scheme | quote }}
  CROCUS__SCORPION__ADMIN__HOST: {{ required "crocus.scorpion.admin.host is required" (((.Values.crocus).scorpion).admin).host | quote }}
  CROCUS__SCORPION__ADMIN__PORT: {{ (((.Values.crocus).scorpion).admin).port | int | default "" | quote }}
  CROCUS__SCORPION__ADMIN__PATH: {{ (((.Values.crocus).scorpion).admin).path | default "" | quote }}
  CROCUS__ORCHID__PUBLIC__SCHEME: {{ required "crocus.orchid.public.scheme is required" (((.Values.crocus).orchid).public).scheme | quote }}
  CROCUS__ORCHID__PUBLIC__HOST: {{ required "crocus.orchid.public.host is required" (((.Values.crocus).orchid).public).host | quote }}
  CROCUS__ORCHID__PUBLIC__PORT: {{ (((.Values.crocus).orchid).public).port | int | default "" | quote }}
  CROCUS__ORCHID__PUBLIC__PATH: {{ (((.Values.crocus).orchid).public).path | default "" | quote }}
