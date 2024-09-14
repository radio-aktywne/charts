apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "webtunes.configMapMetadata" . | nindent 2 }}
data:
  WEBTUNES__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBTUNES__EMITUNES__HTTP__SCHEME: {{ required "app.emitunes.http.scheme is required" (((.Values.app).emitunes).http).scheme | quote }}
  WEBTUNES__EMITUNES__HTTP__HOST: {{ required "app.emitunes.http.host is required" (((.Values.app).emitunes).http).host | quote }}
  WEBTUNES__EMITUNES__HTTP__PORT: {{ required "app.emitunes.http.port is required" (((.Values.app).emitunes).http).port | int | quote }}
  {{- if (((.Values.app).emitunes).http).path }}
  WEBTUNES__EMITUNES__HTTP__PATH: {{ .Values.app.emitunes.http.path | quote }}
  {{- end }}
