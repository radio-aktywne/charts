apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "pelican.configMapMetadata" . | nindent 2 }}
data:
  PELICAN__SERVER__PORT: {{ required "pelican.server.port is required" ((.Values.pelican).server).port | int | quote }}
  {{- if ((.Values.pelican).server).trusted }}
  PELICAN__SERVER__TRUSTED: {{ .Values.pelican.server.trusted | quote }}
  {{- end }}
  PELICAN__GRAPHITE__SQL__HOST: {{ required "pelican.graphite.sql.host is required" (((.Values.pelican).graphite).sql).host | quote }}
  PELICAN__GRAPHITE__SQL__PORT: {{ required "pelican.graphite.sql.port is required" (((.Values.pelican).graphite).sql).port | int | quote }}
  PELICAN__MINIUM__S3__SECURE: {{ required "pelican.minium.s3.secure is required" (((.Values.pelican).minium).s3).secure | quote }}
  PELICAN__MINIUM__S3__HOST: {{ required "pelican.minium.s3.host is required" (((.Values.pelican).minium).s3).host | quote }}
  PELICAN__MINIUM__S3__PORT: {{ required "pelican.minium.s3.port is required" (((.Values.pelican).minium).s3).port | int | quote }}
