apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "daisy.configMapMetadata" . | nindent 2 }}
data:
  DAISY__SERVER__PORT: {{ required "daisy.server.port is required" ((.Values.daisy).server).port | int | quote }}
  DAISY__MANTIS__SCHEME: {{ required "daisy.mantis.scheme is required" ((.Values.daisy).mantis).scheme | quote }}
  DAISY__MANTIS__HOST: {{ required "daisy.mantis.host is required" ((.Values.daisy).mantis).host | quote }}
  DAISY__MANTIS__PORT: {{ ((.Values.daisy).mantis).port | int | default "" | quote }}
  DAISY__MANTIS__PATH: {{ ((.Values.daisy).mantis).path | default "" | quote }}
