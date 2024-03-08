apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emischeduler.configMapMetadata" . | nindent 2 }}
data:
  EMISCHEDULER__SERVER__PORT: {{ required "app.port is required" (.Values.app).port | int | quote }}
  EMISCHEDULER__STREAM__TIMEOUT: {{ required "app.stream.timeout is required" ((.Values.app).stream).timeout | quote }}
  EMISCHEDULER__CLEANER__REFERENCE: {{ required "app.cleaner.reference is required" ((.Values.app).cleaner).reference | quote }}
  EMISCHEDULER__CLEANER__INTERVAL: {{ required "app.cleaner.interval is required" ((.Values.app).cleaner).interval | quote }}
  EMISCHEDULER__SYNCHRONIZER__REFERENCE: {{ required "app.synchronizer.reference is required" ((.Values.app).synchronizer).reference | quote }}
  EMISCHEDULER__SYNCHRONIZER__INTERVAL: {{ required "app.synchronizer.interval is required" ((.Values.app).synchronizer).interval | quote }}
  EMISCHEDULER__SYNCHRONIZER__WINDOW: {{ required "app.synchronizer.window is required" ((.Values.app).synchronizer).window | quote }}
  EMISCHEDULER__EMISHOWS__HOST: {{ required "app.emishows.host is required" ((.Values.app).emishows).host | quote }}
  EMISCHEDULER__EMISHOWS__PORT: {{ required "app.emishows.port is required" ((.Values.app).emishows).port | int | quote }}
  EMISCHEDULER__EMIARCHIVE__HOST: {{ required "app.emiarchive.host is required" ((.Values.app).emiarchive).host | quote }}
  EMISCHEDULER__EMIARCHIVE__PORT: {{ required "app.emiarchive.port is required" ((.Values.app).emiarchive).port | int | quote }}
  EMISCHEDULER__EMIARCHIVE__LIVE_BUCKET: {{ required "app.emiarchive.buckets.live is required" (((.Values.app).emiarchive).buckets).live | quote }}
  EMISCHEDULER__EMIARCHIVE__PRERECORDED_BUCKET: {{ required "app.emiarchive.buckets.prerecorded is required" (((.Values.app).emiarchive).buckets).prerecorded | quote }}
  EMISCHEDULER__EMISTREAM__HOST: {{ required "app.emistream.host is required" ((.Values.app).emistream).host | quote }}
  EMISCHEDULER__EMISTREAM__PORT: {{ required "app.emistream.port is required" ((.Values.app).emistream).port | int | quote }}
