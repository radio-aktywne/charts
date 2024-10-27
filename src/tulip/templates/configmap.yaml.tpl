apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "tulip.configMapMetadata" . | nindent 2 }}
data:
  TULIP__SERVER__PORT: {{ required "tulip.server.port is required" ((.Values.tulip).server).port | int | quote }}
  TULIP__BEAVER__SCHEME: {{ required "tulip.beaver.scheme is required" ((.Values.tulip).beaver).scheme | quote }}
  TULIP__BEAVER__HOST: {{ required "tulip.beaver.host is required" ((.Values.tulip).beaver).host | quote }}
  TULIP__BEAVER__PORT: {{ ((.Values.tulip).beaver).port | int | default "" | quote }}
  TULIP__BEAVER__PATH: {{ ((.Values.tulip).beaver).path | default "" | quote }}
