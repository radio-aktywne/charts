apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "gecko.configMapMetadata" . | nindent 2 }}
data:
  GECKO__SERVER__PORT: {{ required "gecko.server.port is required" ((.Values.gecko).server).port | int | quote }}
  GECKO__BEAVER__HTTP__SCHEME: {{ required "gecko.beaver.http.scheme is required" (((.Values.gecko).beaver).http).scheme | quote }}
  GECKO__BEAVER__HTTP__HOST: {{ required "gecko.beaver.http.host is required" (((.Values.gecko).beaver).http).host | quote }}
  GECKO__BEAVER__HTTP__PORT: {{ (((.Values.gecko).beaver).http).port | int | default "" | quote }}
  GECKO__BEAVER__HTTP__PATH: {{ (((.Values.gecko).beaver).http).path | default "" | quote }}
  GECKO__EMERALD__S3__SECURE: {{ required "gecko.emerald.s3.secure is required" (((.Values.gecko).emerald).s3).secure | quote }}
  GECKO__EMERALD__S3__HOST: {{ required "gecko.emerald.s3.host is required" (((.Values.gecko).emerald).s3).host | quote }}
  GECKO__EMERALD__S3__PORT: {{ (((.Values.gecko).emerald).s3).port | int | default "" | quote }}
