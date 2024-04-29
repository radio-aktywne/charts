apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emischeduler.configMapMetadata" . | nindent 2 }}
data:
  EMISCHEDULER__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  EMISCHEDULER__STREAM__TIMEOUT: {{ required "app.stream.timeout is required" ((.Values.app).stream).timeout | quote }}
  EMISCHEDULER__CLEANER__REFERENCE: {{ required "app.cleaner.reference is required" ((.Values.app).cleaner).reference | quote }}
  EMISCHEDULER__CLEANER__INTERVAL: {{ required "app.cleaner.interval is required" ((.Values.app).cleaner).interval | quote }}
  EMISCHEDULER__SYNCHRONIZER__REFERENCE: {{ required "app.synchronizer.reference is required" ((.Values.app).synchronizer).reference | quote }}
  EMISCHEDULER__SYNCHRONIZER__INTERVAL: {{ required "app.synchronizer.interval is required" ((.Values.app).synchronizer).interval | quote }}
  EMISCHEDULER__SYNCHRONIZER__WINDOW: {{ required "app.synchronizer.window is required" ((.Values.app).synchronizer).window | quote }}
  EMISCHEDULER__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMISCHEDULER__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMISCHEDULER__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMISCHEDULER__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
  EMISCHEDULER__EMIARCHIVE__S3__SECURE: {{ required "app.emiarchive.s3.secure is required" (((.Values.app).emiarchive).s3).secure | quote }}
  EMISCHEDULER__EMIARCHIVE__S3__HOST: {{ required "app.emiarchive.s3.host is required" (((.Values.app).emiarchive).s3).host | quote }}
  EMISCHEDULER__EMIARCHIVE__S3__PORT: {{ required "app.emiarchive.s3.port is required" (((.Values.app).emiarchive).s3).port | int | quote }}
  EMISCHEDULER__EMIARCHIVE__S3__LIVE_BUCKET: {{ required "app.emiarchive.s3.buckets.live is required" ((((.Values.app).emiarchive).s3).buckets).live | quote }}
  EMISCHEDULER__EMIARCHIVE__S3__PRERECORDED_BUCKET: {{ required "app.emiarchive.s3.buckets.prerecorded is required" ((((.Values.app).emiarchive).s3).buckets).prerecorded | quote }}
  EMISCHEDULER__EMISTREAM__HTTP__SCHEME: {{ required "app.emistream.http.scheme is required" (((.Values.app).emistream).http).scheme | quote }}
  EMISCHEDULER__EMISTREAM__HTTP__HOST: {{ required "app.emistream.http.host is required" (((.Values.app).emistream).http).host | quote }}
  EMISCHEDULER__EMISTREAM__HTTP__PORT: {{ required "app.emistream.http.port is required" (((.Values.app).emistream).http).port | int | quote }}
  {{- if (((.Values.app).emistream).http).path }}
  EMISCHEDULER__EMISTREAM__HTTP__PATH: {{ .Values.app.emistream.http.path | quote }}
  {{- end }}
  EMISCHEDULER__EMISTREAM__SRT__HOST: {{ required "app.emistream.srt.host is required" (((.Values.app).emistream).srt).host | quote }}
  EMISCHEDULER__EMISTREAM__SRT__PORT: {{ required "app.emistream.srt.port is required" (((.Values.app).emistream).srt).port | int | quote }}
