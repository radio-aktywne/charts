apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "medialounge.configMapMetadata" . | nindent 2 }}
data:
  MEDIALOUNGE__SERVER__PORTS__S3: {{ required "database.server.ports.s3 is required" (((.Values.database).server).ports).s3 | int | quote }}
  MEDIALOUNGE__SERVER__PORTS__WEB: {{ required "database.server.ports.web is required" (((.Values.database).server).ports).web | int | quote }}
  MEDIALOUNGE__URLS__WEB: {{ required "database.urls.web is required" ((.Values.database).urls).web | quote }}
