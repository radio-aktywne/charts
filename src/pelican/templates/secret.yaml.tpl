apiVersion: v1
kind: Secret
metadata:
  {{- include "pelican.secretMetadata" . | nindent 2 }}
stringData:
  PELICAN__GRAPHITE__SQL__PASSWORD: {{ required "pelican.graphite.sql.password is required" (((.Values.pelican).graphite).sql).password | quote }}
  PELICAN__MINIUM__S3__PASSWORD: {{ required "pelican.minium.s3.password is required" (((.Values.pelican).minium).s3).password | quote }}
  PELICAN__MINIUM__S3__USER: {{ required "pelican.minium.s3.user is required" (((.Values.pelican).minium).s3).user | quote }}
