apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emistream.configMapMetadata" . | nindent 2 }}
data:
  EMISTREAM__SERVER__PORT: {{ required "app.ports.http is required" ((.Values.app).ports).http | int | quote }}
  EMISTREAM__STREAM__PORT: {{ required "app.ports.srt is required" ((.Values.app).ports).srt | int | quote }}
  EMISTREAM__STREAM__TIMEOUT: {{ required "app.stream.timeout is required" ((.Values.app).stream).timeout | quote }}
  EMISTREAM__STREAM__WINDOW: {{ required "app.stream.window is required" ((.Values.app).stream).window | quote }}
  EMISTREAM__FUSION__HOST: {{ required "app.fusion.host is required" ((.Values.app).fusion).host | quote }}
  EMISTREAM__FUSION__PORT: {{ required "app.fusion.port is required" ((.Values.app).fusion).port | int | quote }}
  EMISTREAM__EMIRECORDER__HOST: {{ required "app.emirecorder.host is required" ((.Values.app).emirecorder).host | quote }}
  EMISTREAM__EMIRECORDER__PORT: {{ required "app.emirecorder.port is required" ((.Values.app).emirecorder).port | int | quote }}
  EMISTREAM__EMISHOWS__HOST: {{ required "app.emishows.host is required" ((.Values.app).emishows).host | quote }}
  EMISTREAM__EMISHOWS__PORT: {{ required "app.emishows.port is required" ((.Values.app).emishows).port | int | quote }}
