apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "webfuse.configMapMetadata" . | nindent 2 }}
data:
  WEBFUSE__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBFUSE__EMIFUSE__HTTP__SCHEME: {{ required "app.emifuse.http.scheme is required" (((.Values.app).emifuse).http).scheme | quote }}
  WEBFUSE__EMIFUSE__HTTP__HOST: {{ required "app.emifuse.http.host is required" (((.Values.app).emifuse).http).host | quote }}
  WEBFUSE__EMIFUSE__HTTP__PORT: {{ required "app.emifuse.http.port is required" (((.Values.app).emifuse).http).port | int | quote }}
  {{- if (((.Values.app).emifuse).http).path }}
  WEBFUSE__EMIFUSE__HTTP__PATH: {{ .Values.app.emifuse.http.path | quote }}
  {{- end }}
  WEBFUSE__EMITUNES__HTTP__SCHEME: {{ required "app.emitunes.http.scheme is required" (((.Values.app).emitunes).http).scheme | quote }}
  WEBFUSE__EMITUNES__HTTP__HOST: {{ required "app.emitunes.http.host is required" (((.Values.app).emitunes).http).host | quote }}
  WEBFUSE__EMITUNES__HTTP__PORT: {{ required "app.emitunes.http.port is required" (((.Values.app).emitunes).http).port | int | quote }}
  {{- if (((.Values.app).emitunes).http).path }}
  WEBFUSE__EMITUNES__HTTP__PATH: {{ .Values.app.emitunes.http.path | quote }}
  {{- end }}
