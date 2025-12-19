apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "aster.configMapMetadata" . | nindent 2 }}
data:
  ASTER__DEBUG: {{ required "aster.debug is required" (.Values.aster).debug | quote }}
  ASTER__DINGO__HTTP__HOST: {{ required "aster.dingo.http.host is required" (((.Values.aster).dingo).http).host | quote }}
  ASTER__DINGO__HTTP__PATH: {{ (((.Values.aster).dingo).http).path | default "" | quote }}
  ASTER__DINGO__HTTP__PORT: {{ (((.Values.aster).dingo).http).port | int | default "" | quote }}
  ASTER__DINGO__HTTP__SCHEME: {{ required "aster.dingo.http.scheme is required" (((.Values.aster).dingo).http).scheme | quote }}
  ASTER__PELICAN__HTTP__HOST: {{ required "aster.pelican.http.host is required" (((.Values.aster).pelican).http).host | quote }}
  ASTER__PELICAN__HTTP__PATH: {{ (((.Values.aster).pelican).http).path | default "" | quote }}
  ASTER__PELICAN__HTTP__PORT: {{ (((.Values.aster).pelican).http).port | int | default "" | quote }}
  ASTER__PELICAN__HTTP__SCHEME: {{ required "aster.pelican.http.scheme is required" (((.Values.aster).pelican).http).scheme | quote }}
  ASTER__SCORPION__PUBLIC__HOST: {{ required "aster.scorpion.public.host is required" (((.Values.aster).scorpion).public).host | quote }}
  ASTER__SCORPION__PUBLIC__PATH: {{ (((.Values.aster).scorpion).public).path | default "" | quote }}
  ASTER__SCORPION__PUBLIC__PORT: {{ (((.Values.aster).scorpion).public).port | int | default "" | quote }}
  ASTER__SCORPION__PUBLIC__SCHEME: {{ required "aster.scorpion.public.scheme is required" (((.Values.aster).scorpion).public).scheme | quote }}
  ASTER__SERVER__PORT: {{ required "aster.server.port is required" ((.Values.aster).server).port | int | quote }}
  ASTER__URLS__PUBLIC: {{ required "aster.urls.public is required" ((.Values.aster).urls).public | quote }}
