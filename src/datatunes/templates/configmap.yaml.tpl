apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "datatunes.configMapMetadata" . | nindent 2 }}
data:
  DATATUNES__SERVER__PORTS__S3: {{ required "database.server.ports.s3 is required" (((.Values.database).server).ports).s3 | int | quote }}
  DATATUNES__SERVER__PORTS__WEB: {{ required "database.server.ports.web is required" (((.Values.database).server).ports).web | int | quote }}
  DATATUNES__URLS__WEB: {{ required "database.urls.web is required" ((.Values.database).urls).web | quote }}
  DATATUNES__BUCKETS__MEDIA: {{ required "database.buckets.media is required" ((.Values.database).buckets).media | quote }}
  DATATUNES__BUCKETS__METADATA: {{ required "database.buckets.metadata is required" ((.Values.database).buckets).metadata | quote }}
