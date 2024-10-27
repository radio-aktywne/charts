apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "lotus.configMapMetadata" . | nindent 2 }}
data:
  LOTUS__SERVER__PORT: {{ required "lotus.server.port is required" ((.Values.lotus).server).port | int | quote }}
  LOTUS__PELICAN__HTTP__SCHEME: {{ required "lotus.pelican.http.scheme is required" (((.Values.lotus).pelican).http).scheme | quote }}
  LOTUS__PELICAN__HTTP__HOST: {{ required "lotus.pelican.http.host is required" (((.Values.lotus).pelican).http).host | quote }}
  LOTUS__PELICAN__HTTP__PORT: {{ (((.Values.lotus).pelican).http).port | int | default "" | quote }}
  LOTUS__PELICAN__HTTP__PATH: {{ (((.Values.lotus).pelican).http).path | default "" | quote }}
