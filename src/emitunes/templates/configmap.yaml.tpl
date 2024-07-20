apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emitunes.configMapMetadata" . | nindent 2 }}
data:
  EMITUNES__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  {{- if ((.Values.app).server).trusted }}
  EMITUNES__SERVER__TRUSTED: {{ .Values.app.server.trusted | quote }}
  {{- end }}
  EMITUNES__DATATUNES__SQL__HOST: {{ required "app.datatunes.sql.host is required" (((.Values.app).datatunes).sql).host | quote }}
  EMITUNES__DATATUNES__SQL__PORT: {{ required "app.datatunes.sql.port is required" (((.Values.app).datatunes).sql).port | int | quote }}
  EMITUNES__MEDIATUNES__S3__SECURE: {{ required "app.mediatunes.s3.secure is required" (((.Values.app).mediatunes).s3).secure | quote }}
  EMITUNES__MEDIATUNES__S3__HOST: {{ required "app.mediatunes.s3.host is required" (((.Values.app).mediatunes).s3).host | quote }}
  EMITUNES__MEDIATUNES__S3__PORT: {{ required "app.mediatunes.s3.port is required" (((.Values.app).mediatunes).s3).port | int | quote }}
