apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emilounge.configMapMetadata" . | nindent 2 }}
data:
  EMILOUNGE__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  EMILOUNGE__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMILOUNGE__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMILOUNGE__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMILOUNGE__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
  EMILOUNGE__MEDIALOUNGE__S3__SECURE: {{ required "app.medialounge.s3.secure is required" (((.Values.app).medialounge).s3).secure | quote }}
  EMILOUNGE__MEDIALOUNGE__S3__HOST: {{ required "app.medialounge.s3.host is required" (((.Values.app).medialounge).s3).host | quote }}
  EMILOUNGE__MEDIALOUNGE__S3__PORT: {{ required "app.medialounge.s3.port is required" (((.Values.app).medialounge).s3).port | int | quote }}
