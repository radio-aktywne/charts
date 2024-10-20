apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "lotus.configMapMetadata" . | nindent 2 }}
data:
  LOTUS__SERVER__PORT: {{ required "lotus.server.port is required" ((.Values.lotus).server).port | int | quote }}
  LOTUS__PELICAN__HTTP__SCHEME: {{ required "lotus.pelican.http.scheme is required" (((.Values.lotus).pelican).http).scheme | quote }}
  LOTUS__PELICAN__HTTP__HOST: {{ required "lotus.pelican.http.host is required" (((.Values.lotus).pelican).http).host | quote }}
  LOTUS__PELICAN__HTTP__PORT: {{ required "lotus.pelican.http.port is required" (((.Values.lotus).pelican).http).port | int | quote }}
  {{- if (((.Values.lotus).pelican).http).path }}
  LOTUS__PELICAN__HTTP__PATH: {{ .Values.lotus.pelican.http.path | quote }}
  {{- end }}
