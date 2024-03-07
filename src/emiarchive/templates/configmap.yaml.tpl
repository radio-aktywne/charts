apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emiarchive.configMapMetadata" . | nindent 2 }}
data:
  EMIARCHIVE_PORT: {{ required "database.ports.s3 is required" ((.Values.database).ports).s3 | int | quote }}
  EMIARCHIVE_WEB_PORT: {{ required "database.ports.web is required" ((.Values.database).ports).web | int | quote }}
  EMIARCHIVE_WEB_PUBLIC_URL: {{ required "database.urls.web is required" ((.Values.database).urls).web | quote }}
  EMIARCHIVE_LIVE_BUCKET: {{ required "database.buckets.live is required" ((.Values.database).buckets).live | quote }}
  EMIARCHIVE_PRERECORDED_BUCKET: {{ required "database.buckets.prerecorded is required" ((.Values.database).buckets).prerecorded | quote }}
