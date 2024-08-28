apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emirecords.configMapMetadata" . | nindent 2 }}
data:
  EMIRECORDS__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  EMIRECORDS__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMIRECORDS__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMIRECORDS__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMIRECORDS__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
  EMIRECORDS__MEDIARECORDS__S3__SECURE: {{ required "app.mediarecords.s3.secure is required" (((.Values.app).mediarecords).s3).secure | quote }}
  EMIRECORDS__MEDIARECORDS__S3__HOST: {{ required "app.mediarecords.s3.host is required" (((.Values.app).mediarecords).s3).host | quote }}
  EMIRECORDS__MEDIARECORDS__S3__PORT: {{ required "app.mediarecords.s3.port is required" (((.Values.app).mediarecords).s3).port | int | quote }}
