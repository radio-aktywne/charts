apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "aster.configMapMetadata" . | nindent 2 }}
data:
  ASTER__SERVER__PORT: {{ required "aster.server.port is required" ((.Values.aster).server).port | int | quote }}
  ASTER__DINGO__HTTP__SCHEME: {{ required "aster.dingo.http.scheme is required" (((.Values.aster).dingo).http).scheme | quote }}
  ASTER__DINGO__HTTP__HOST: {{ required "aster.dingo.http.host is required" (((.Values.aster).dingo).http).host | quote }}
  ASTER__DINGO__HTTP__PORT: {{ required "aster.dingo.http.port is required" (((.Values.aster).dingo).http).port | int | quote }}
  {{- if (((.Values.aster).dingo).http).path }}
  ASTER__DINGO__HTTP__PATH: {{ .Values.aster.dingo.http.path | quote }}
  {{- end }}
  ASTER__PELICAN__HTTP__SCHEME: {{ required "aster.pelican.http.scheme is required" (((.Values.aster).pelican).http).scheme | quote }}
  ASTER__PELICAN__HTTP__HOST: {{ required "aster.pelican.http.host is required" (((.Values.aster).pelican).http).host | quote }}
  ASTER__PELICAN__HTTP__PORT: {{ required "aster.pelican.http.port is required" (((.Values.aster).pelican).http).port | int | quote }}
  {{- if (((.Values.aster).pelican).http).path }}
  ASTER__PELICAN__HTTP__PATH: {{ .Values.aster.pelican.http.path | quote }}
  {{- end }}
