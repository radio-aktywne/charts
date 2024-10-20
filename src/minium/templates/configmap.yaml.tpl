apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "minium.configMapMetadata" . | nindent 2 }}
data:
  MINIUM__SERVER__PORTS__S3: {{ required "minium.server.ports.s3 is required" (((.Values.minium).server).ports).s3 | int | quote }}
  MINIUM__SERVER__PORTS__WEB: {{ required "minium.server.ports.web is required" (((.Values.minium).server).ports).web | int | quote }}
  MINIUM__URLS__WEB: {{ required "minium.urls.web is required" ((.Values.minium).urls).web | quote }}
