apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "datarecords.configMapMetadata" . | nindent 2 }}
data:
  DATARECORDS__SERVER__PORTS__S3: {{ required "database.server.ports.s3 is required" (((.Values.database).server).ports).s3 | int | quote }}
  DATARECORDS__SERVER__PORTS__WEB: {{ required "database.server.ports.web is required" (((.Values.database).server).ports).web | int | quote }}
  DATARECORDS__URLS__WEB: {{ required "database.urls.web is required" ((.Values.database).urls).web | quote }}
  DATARECORDS__BUCKETS__LIVE: {{ required "database.buckets.live is required" ((.Values.database).buckets).live | quote }}
  DATARECORDS__BUCKETS__PRERECORDED: {{ required "database.buckets.prerecorded is required" ((.Values.database).buckets).prerecorded | quote }}
