apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "sunflower.configMapMetadata" . | nindent 2 }}
data:
  SUNFLOWER__APIS__ICANHAZDADJOKE__HOST: {{ required "sunflower.apis.icanhazdadjoke.host is required" (((.Values.sunflower).apis).icanhazdadjoke).host | quote }}
  SUNFLOWER__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.sunflower).apis).icanhazdadjoke).path | default "" | quote }}
  SUNFLOWER__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.sunflower).apis).icanhazdadjoke).port | int | default "" | quote }}
  SUNFLOWER__APIS__ICANHAZDADJOKE__SCHEME: {{ required "sunflower.apis.icanhazdadjoke.scheme is required" (((.Values.sunflower).apis).icanhazdadjoke).scheme | quote }}
  SUNFLOWER__APPS: {{ required "sunflower.apps is required" (.Values.sunflower).apps | mustToJson | quote }}
  SUNFLOWER__DEBUG: {{ required "sunflower.debug is required" (.Values.sunflower).debug | quote }}
  SUNFLOWER__IDENTITY__USERS__DEBUG__ID: {{ required "sunflower.identity.users.debug.id is required" ((((.Values.sunflower).identity).users).debug).id | quote }}
  SUNFLOWER__IDENTITY__USERS__DEBUG__TRAITS__LOCALES__PREFERRED: {{ ((((((.Values.sunflower).identity).users).debug).traits).locales).preferred | default "" | quote }}
  SUNFLOWER__IDENTITY__USERS__DEBUG__TRAITS__NAMES__DISPLAY: {{ required "sunflower.identity.users.debug.traits.names.display is required" ((((((.Values.sunflower).identity).users).debug).traits).names).display | quote }}
  SUNFLOWER__IDENTITY__USERS__DEBUG__TRAITS__PICTURES__PROFILE__URL: {{ (((((((.Values.sunflower).identity).users).debug).traits).pictures).profile).url | default "" | quote }}
  SUNFLOWER__SERVER__PORT: {{ required "sunflower.server.port is required" ((.Values.sunflower).server).port | int | quote }}
  SUNFLOWER__URLS__ORCHID__HOST: {{ required "sunflower.urls.orchid.host is required" (((.Values.sunflower).urls).orchid).host | quote }}
  SUNFLOWER__URLS__ORCHID__PATH: {{ (((.Values.sunflower).urls).orchid).path | default "" | quote }}
  SUNFLOWER__URLS__ORCHID__PORT: {{ (((.Values.sunflower).urls).orchid).port | int | default "" | quote }}
  SUNFLOWER__URLS__ORCHID__SCHEME: {{ required "sunflower.urls.orchid.scheme is required" (((.Values.sunflower).urls).orchid).scheme | quote }}
