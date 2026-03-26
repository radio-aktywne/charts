apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "magnolia.configMapMetadata" . | nindent 2 }}
data:
  MAGNOLIA__APIS__BEAVER__HOST: {{ required "magnolia.apis.beaver.host is required" (((.Values.magnolia).apis).beaver).host | quote }}
  MAGNOLIA__APIS__BEAVER__PATH: {{ (((.Values.magnolia).apis).beaver).path | default "" | quote }}
  MAGNOLIA__APIS__BEAVER__PORT: {{ (((.Values.magnolia).apis).beaver).port | int | default "" | quote }}
  MAGNOLIA__APIS__BEAVER__SCHEME: {{ required "magnolia.apis.beaver.scheme is required" (((.Values.magnolia).apis).beaver).scheme | quote }}
  MAGNOLIA__APIS__GECKO__HOST: {{ required "magnolia.apis.gecko.host is required" (((.Values.magnolia).apis).gecko).host | quote }}
  MAGNOLIA__APIS__GECKO__PATH: {{ (((.Values.magnolia).apis).gecko).path | default "" | quote }}
  MAGNOLIA__APIS__GECKO__PORT: {{ (((.Values.magnolia).apis).gecko).port | int | default "" | quote }}
  MAGNOLIA__APIS__GECKO__SCHEME: {{ required "magnolia.apis.gecko.scheme is required" (((.Values.magnolia).apis).gecko).scheme | quote }}
  MAGNOLIA__APIS__ICANHAZDADJOKE__HOST: {{ required "magnolia.apis.icanhazdadjoke.host is required" (((.Values.magnolia).apis).icanhazdadjoke).host | quote }}
  MAGNOLIA__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.magnolia).apis).icanhazdadjoke).path | default "" | quote }}
  MAGNOLIA__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.magnolia).apis).icanhazdadjoke).port | int | default "" | quote }}
  MAGNOLIA__APIS__ICANHAZDADJOKE__SCHEME: {{ required "magnolia.apis.icanhazdadjoke.scheme is required" (((.Values.magnolia).apis).icanhazdadjoke).scheme | quote }}
  MAGNOLIA__DEBUG: {{ required "magnolia.debug is required" (.Values.magnolia).debug | quote }}
  MAGNOLIA__SERVER__PORT: {{ required "magnolia.server.port is required" ((.Values.magnolia).server).port | int | quote }}
