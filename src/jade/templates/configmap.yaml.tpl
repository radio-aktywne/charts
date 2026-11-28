apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "jade.configMapMetadata" . | nindent 2 }}
data:
  JADE__SERVER__PORTS__S3: {{ required "jade.server.ports.s3 is required" (((.Values.jade).server).ports).s3 | int | quote }}
  JADE__SERVER__PORTS__WEB: {{ required "jade.server.ports.web is required" (((.Values.jade).server).ports).web | int | quote }}
