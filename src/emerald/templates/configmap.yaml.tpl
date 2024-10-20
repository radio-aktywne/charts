apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emerald.configMapMetadata" . | nindent 2 }}
data:
  EMERALD__SERVER__PORTS__S3: {{ required "emerald.server.ports.s3 is required" (((.Values.emerald).server).ports).s3 | int | quote }}
  EMERALD__SERVER__PORTS__WEB: {{ required "emerald.server.ports.web is required" (((.Values.emerald).server).ports).web | int | quote }}
  EMERALD__URLS__WEB: {{ required "emerald.urls.web is required" ((.Values.emerald).urls).web | quote }}
