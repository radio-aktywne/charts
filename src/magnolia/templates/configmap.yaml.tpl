apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "magnolia.configMapMetadata" . | nindent 2 }}
data:
  MAGNOLIA__SERVER__PORT: {{ required "magnolia.server.port is required" ((.Values.magnolia).server).port | int | quote }}
  MAGNOLIA__BEAVER__HTTP__SCHEME: {{ required "magnolia.beaver.http.scheme is required" (((.Values.magnolia).beaver).http).scheme | quote }}
  MAGNOLIA__BEAVER__HTTP__HOST: {{ required "magnolia.beaver.http.host is required" (((.Values.magnolia).beaver).http).host | quote }}
  MAGNOLIA__BEAVER__HTTP__PORT: {{ (((.Values.magnolia).beaver).http).port | int | default "" | quote }}
  MAGNOLIA__BEAVER__HTTP__PATH: {{ (((.Values.magnolia).beaver).http).path | default "" | quote }}
  MAGNOLIA__GECKO__HTTP__SCHEME: {{ required "magnolia.gecko.http.scheme is required" (((.Values.magnolia).gecko).http).scheme | quote }}
  MAGNOLIA__GECKO__HTTP__HOST: {{ required "magnolia.gecko.http.host is required" (((.Values.magnolia).gecko).http).host | quote }}
  MAGNOLIA__GECKO__HTTP__PORT: {{ (((.Values.magnolia).gecko).http).port | int | default "" | quote }}
  MAGNOLIA__GECKO__HTTP__PATH: {{ (((.Values.magnolia).gecko).http).path | default "" | quote }}
