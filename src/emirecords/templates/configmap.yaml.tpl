apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emirecords.configMapMetadata" . | nindent 2 }}
data:
  EMIRECORDS__SERVER__PORTS__HTTP: {{ required "app.server.ports.http is required" (((.Values.app).server).ports).http | int | quote }}
  EMIRECORDS__SERVER__PORTS__SRT: {{ required "app.server.ports.srt is required" (((.Values.app).server).ports).srt | int | quote }}
  EMIRECORDS__RECORDER__TIMEOUT: {{ required "app.recorder.timeout is required" ((.Values.app).recorder).timeout | quote }}
  EMIRECORDS__RECORDER__WINDOW: {{ required "app.recorder.window is required" ((.Values.app).recorder).window | quote }}
  EMIRECORDS__DATARECORDS__S3__SECURE: {{ required "app.datarecords.s3.secure is required" (((.Values.app).datarecords).s3).secure | quote }}
  EMIRECORDS__DATARECORDS__S3__HOST: {{ required "app.datarecords.s3.host is required" (((.Values.app).datarecords).s3).host | quote }}
  EMIRECORDS__DATARECORDS__S3__PORT: {{ required "app.datarecords.s3.port is required" (((.Values.app).datarecords).s3).port | int | quote }}
  EMIRECORDS__DATARECORDS__S3__BUCKET: {{ required "app.datarecords.s3.bucket is required" (((.Values.app).datarecords).s3).bucket | quote }}
  EMIRECORDS__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMIRECORDS__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMIRECORDS__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMIRECORDS__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
