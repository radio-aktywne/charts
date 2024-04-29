apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emirecorder.configMapMetadata" . | nindent 2 }}
data:
  EMIRECORDER__SERVER__PORTS__HTTP: {{ required "app.server.ports.http is required" (((.Values.app).server).ports).http | int | quote }}
  EMIRECORDER__SERVER__PORTS__SRT: {{ required "app.server.ports.srt is required" (((.Values.app).server).ports).srt | int | quote }}
  EMIRECORDER__RECORDER__TIMEOUT: {{ required "app.recorder.timeout is required" ((.Values.app).recorder).timeout | quote }}
  EMIRECORDER__RECORDER__WINDOW: {{ required "app.recorder.window is required" ((.Values.app).recorder).window | quote }}
  EMIRECORDER__EMIARCHIVE__S3__SECURE: {{ required "app.emiarchive.s3.secure is required" (((.Values.app).emiarchive).s3).secure | quote }}
  EMIRECORDER__EMIARCHIVE__S3__HOST: {{ required "app.emiarchive.s3.host is required" (((.Values.app).emiarchive).s3).host | quote }}
  EMIRECORDER__EMIARCHIVE__S3__PORT: {{ required "app.emiarchive.s3.port is required" (((.Values.app).emiarchive).s3).port | int | quote }}
  EMIRECORDER__EMIARCHIVE__S3__BUCKET: {{ required "app.emiarchive.s3.bucket is required" (((.Values.app).emiarchive).s3).bucket | quote }}
  EMIRECORDER__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMIRECORDER__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMIRECORDER__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMIRECORDER__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
