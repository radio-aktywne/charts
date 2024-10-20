apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "amber.configMapMetadata" . | nindent 2 }}
data:
  AMBER__SERVER__PORTS__S3: {{ required "amber.server.ports.s3 is required" (((.Values.amber).server).ports).s3 | int | quote }}
  AMBER__SERVER__PORTS__WEB: {{ required "amber.server.ports.web is required" (((.Values.amber).server).ports).web | int | quote }}
  AMBER__URLS__WEB: {{ required "amber.urls.web is required" ((.Values.amber).urls).web | quote }}
