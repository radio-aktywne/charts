apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "weblounge.configMapMetadata" . | nindent 2 }}
data:
  WEBLOUNGE__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBLOUNGE__EMILOUNGE__HTTP__SCHEME: {{ required "app.emilounge.http.scheme is required" (((.Values.app).emilounge).http).scheme | quote }}
  WEBLOUNGE__EMILOUNGE__HTTP__HOST: {{ required "app.emilounge.http.host is required" (((.Values.app).emilounge).http).host | quote }}
  WEBLOUNGE__EMILOUNGE__HTTP__PORT: {{ required "app.emilounge.http.port is required" (((.Values.app).emilounge).http).port | int | quote }}
  {{- if (((.Values.app).emilounge).http).path }}
  WEBLOUNGE__EMILOUNGE__HTTP__PATH: {{ .Values.app.emilounge.http.path | quote }}
  {{- end }}
  WEBLOUNGE__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  WEBLOUNGE__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  WEBLOUNGE__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  WEBLOUNGE__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
