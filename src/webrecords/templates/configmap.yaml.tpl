apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "webrecords.configMapMetadata" . | nindent 2 }}
data:
  WEBRECORDS__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBRECORDS__EMIRECORDS__HTTP__SCHEME: {{ required "app.emirecords.http.scheme is required" (((.Values.app).emirecords).http).scheme | quote }}
  WEBRECORDS__EMIRECORDS__HTTP__HOST: {{ required "app.emirecords.http.host is required" (((.Values.app).emirecords).http).host | quote }}
  WEBRECORDS__EMIRECORDS__HTTP__PORT: {{ required "app.emirecords.http.port is required" (((.Values.app).emirecords).http).port | int | quote }}
  {{- if (((.Values.app).emirecords).http).path }}
  WEBRECORDS__EMIRECORDS__HTTP__PATH: {{ .Values.app.emirecords.http.path | quote }}
  {{- end }}
  WEBRECORDS__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  WEBRECORDS__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  WEBRECORDS__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  WEBRECORDS__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
