apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "webshows.configMapMetadata" . | nindent 2 }}
data:
  WEBSHOWS__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBSHOWS__EMISHOWS__SCHEME: {{ required "app.emishows.scheme is required" ((.Values.app).emishows).scheme | quote }}
  WEBSHOWS__EMISHOWS__HOST: {{ required "app.emishows.host is required" ((.Values.app).emishows).host | quote }}
  WEBSHOWS__EMISHOWS__PORT: {{ required "app.emishows.port is required" ((.Values.app).emishows).port | int | quote }}
  {{- if ((.Values.app).emishows).path }}
  WEBSHOWS__EMISHOWS__PATH: {{ .Values.app.emishows.path | quote }}
  {{- end }}
