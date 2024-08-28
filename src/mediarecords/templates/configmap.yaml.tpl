apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "mediarecords.configMapMetadata" . | nindent 2 }}
data:
  MEDIARECORDS__SERVER__PORTS__S3: {{ required "database.server.ports.s3 is required" (((.Values.database).server).ports).s3 | int | quote }}
  MEDIARECORDS__SERVER__PORTS__WEB: {{ required "database.server.ports.web is required" (((.Values.database).server).ports).web | int | quote }}
  MEDIARECORDS__URLS__WEB: {{ required "database.urls.web is required" ((.Values.database).urls).web | quote }}
