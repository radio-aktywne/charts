apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "webscheduler.configMapMetadata" . | nindent 2 }}
data:
  WEBSCHEDULER__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBSCHEDULER__EMISCHEDULER__SCHEME: {{ required "app.emischeduler.scheme is required" ((.Values.app).emischeduler).scheme | quote }}
  WEBSCHEDULER__EMISCHEDULER__HOST: {{ required "app.emischeduler.host is required" ((.Values.app).emischeduler).host | quote }}
  WEBSCHEDULER__EMISCHEDULER__PORT: {{ required "app.emischeduler.port is required" ((.Values.app).emischeduler).port | int | quote }}
  {{- if ((.Values.app).emischeduler).path }}
  WEBSCHEDULER__EMISCHEDULER__PATH: {{ .Values.app.emischeduler.path | quote }}
  {{- end }}
