apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "numbat.configMapMetadata" . | nindent 2 }}
data:
  NUMBAT__AMBER__S3__HOST: {{ required "numbat.amber.s3.host is required" (((.Values.numbat).amber).s3).host | quote }}
  NUMBAT__AMBER__S3__PORT: {{ (((.Values.numbat).amber).s3).port | int | default "" | quote }}
  NUMBAT__AMBER__S3__SECURE: {{ required "numbat.amber.s3.secure is required" (((.Values.numbat).amber).s3).secure | quote }}
  NUMBAT__BEAVER__HTTP__HOST: {{ required "numbat.beaver.http.host is required" (((.Values.numbat).beaver).http).host | quote }}
  NUMBAT__BEAVER__HTTP__PATH: {{ (((.Values.numbat).beaver).http).path | default "" | quote }}
  NUMBAT__BEAVER__HTTP__PORT: {{ (((.Values.numbat).beaver).http).port | int | default "" | quote }}
  NUMBAT__BEAVER__HTTP__SCHEME: {{ required "numbat.beaver.http.scheme is required" (((.Values.numbat).beaver).http).scheme | quote }}
  NUMBAT__DEBUG: {{ required "numbat.debug is required" (.Values.numbat).debug | quote }}
  NUMBAT__SERVER__PORT: {{ required "numbat.server.port is required" ((.Values.numbat).server).port | int | quote }}
