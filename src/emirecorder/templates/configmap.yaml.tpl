apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emirecorder.configMapMetadata" . | nindent 2 }}
data:
  EMIRECORDER__SERVER__PORT: {{ required "app.ports.http is required" ((.Values.app).ports).http | int | quote }}
  EMIRECORDER__RECORDER__PORTS: {{ required "app.ports.srt is required" ((.Values.app).ports).srt | int | quote }}
  EMIRECORDER__RECORDER__TIMEOUT: {{ required "app.recorder.timeout is required" ((.Values.app).recorder).timeout | quote }}
  EMIRECORDER__RECORDER__WINDOW: {{ required "app.recorder.window is required" ((.Values.app).recorder).window | quote }}
  EMIRECORDER__EMIARCHIVE__HOST: {{ required "app.emiarchive.host is required" ((.Values.app).emiarchive).host | quote }}
  EMIRECORDER__EMIARCHIVE__PORT: {{ required "app.emiarchive.port is required" ((.Values.app).emiarchive).port | int | quote }}
  EMIRECORDER__EMIARCHIVE__BUCKET: {{ required "app.emiarchive.bucket is required" ((.Values.app).emiarchive).bucket | quote }}
  EMIRECORDER__EMISHOWS__HOST: {{ required "app.emishows.host is required" ((.Values.app).emishows).host | quote }}
  EMIRECORDER__EMISHOWS__PORT: {{ required "app.emishows.port is required" ((.Values.app).emishows).port | int | quote }}
