apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "magnolia.configMapMetadata" . | nindent 2 }}
data:
  MAGNOLIA__SERVER__PORT: {{ required "magnolia.server.port is required" ((.Values.magnolia).server).port | int | quote }}
  MAGNOLIA__BEAVER__HTTP__SCHEME: {{ required "magnolia.beaver.http.scheme is required" (((.Values.magnolia).beaver).http).scheme | quote }}
  MAGNOLIA__BEAVER__HTTP__HOST: {{ required "magnolia.beaver.http.host is required" (((.Values.magnolia).beaver).http).host | quote }}
  MAGNOLIA__BEAVER__HTTP__PORT: {{ required "magnolia.beaver.http.port is required" (((.Values.magnolia).beaver).http).port | int | quote }}
  {{- if (((.Values.magnolia).beaver).http).path }}
  MAGNOLIA__BEAVER__HTTP__PATH: {{ .Values.magnolia.beaver.http.path | quote }}
  {{- end }}
  MAGNOLIA__GECKO__HTTP__SCHEME: {{ required "magnolia.gecko.http.scheme is required" (((.Values.magnolia).gecko).http).scheme | quote }}
  MAGNOLIA__GECKO__HTTP__HOST: {{ required "magnolia.gecko.http.host is required" (((.Values.magnolia).gecko).http).host | quote }}
  MAGNOLIA__GECKO__HTTP__PORT: {{ required "magnolia.gecko.http.port is required" (((.Values.magnolia).gecko).http).port | int | quote }}
  {{- if (((.Values.magnolia).gecko).http).path }}
  MAGNOLIA__GECKO__HTTP__PATH: {{ .Values.magnolia.gecko.http.path | quote }}
  {{- end }}
