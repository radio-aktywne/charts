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
  MAGNOLIA__IDENTITY__USERS__DEBUG__ID: {{ required "magnolia.identity.users.debug.id is required" ((((.Values.magnolia).identity).users).debug).id | quote }}
  MAGNOLIA__IDENTITY__USERS__DEBUG__TRAITS__LOCALES__PREFERRED: {{ ((((((.Values.magnolia).identity).users).debug).traits).locales).preferred | default "" | quote }}
  MAGNOLIA__IDENTITY__USERS__DEBUG__TRAITS__NAMES__DISPLAY: {{ required "magnolia.identity.users.debug.traits.names.display is required" ((((((.Values.magnolia).identity).users).debug).traits).names).display | quote }}
  MAGNOLIA__IDENTITY__USERS__DEBUG__TRAITS__PICTURES__PROFILE__URL: {{ (((((((.Values.magnolia).identity).users).debug).traits).pictures).profile).url | default "" | quote }}
  MAGNOLIA__SERVER__PORT: {{ required "magnolia.server.port is required" ((.Values.magnolia).server).port | int | quote }}
  MAGNOLIA__URLS__ORCHID__HOST: {{ required "magnolia.urls.orchid.host is required" (((.Values.magnolia).urls).orchid).host | quote }}
  MAGNOLIA__URLS__ORCHID__PATH: {{ (((.Values.magnolia).urls).orchid).path | default "" | quote }}
  MAGNOLIA__URLS__ORCHID__PORT: {{ (((.Values.magnolia).urls).orchid).port | int | default "" | quote }}
  MAGNOLIA__URLS__ORCHID__SCHEME: {{ required "magnolia.urls.orchid.scheme is required" (((.Values.magnolia).urls).orchid).scheme | quote }}
  MAGNOLIA__URLS__SUNFLOWER__HOST: {{ required "magnolia.urls.sunflower.host is required" (((.Values.magnolia).urls).sunflower).host | quote }}
  MAGNOLIA__URLS__SUNFLOWER__PATH: {{ (((.Values.magnolia).urls).sunflower).path | default "" | quote }}
  MAGNOLIA__URLS__SUNFLOWER__PORT: {{ (((.Values.magnolia).urls).sunflower).port | int | default "" | quote }}
  MAGNOLIA__URLS__SUNFLOWER__SCHEME: {{ required "magnolia.urls.sunflower.scheme is required" (((.Values.magnolia).urls).sunflower).scheme | quote }}
