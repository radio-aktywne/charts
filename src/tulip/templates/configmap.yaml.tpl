apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "tulip.configMapMetadata" . | nindent 2 }}
data:
  TULIP__APIS__BEAVER__HOST: {{ required "tulip.apis.beaver.host is required" (((.Values.tulip).apis).beaver).host | quote }}
  TULIP__APIS__BEAVER__PATH: {{ (((.Values.tulip).apis).beaver).path | default "" | quote }}
  TULIP__APIS__BEAVER__PORT: {{ (((.Values.tulip).apis).beaver).port | int | default "" | quote }}
  TULIP__APIS__BEAVER__SCHEME: {{ required "tulip.apis.beaver.scheme is required" (((.Values.tulip).apis).beaver).scheme | quote }}
  TULIP__APIS__ICANHAZDADJOKE__HOST: {{ required "tulip.apis.icanhazdadjoke.host is required" (((.Values.tulip).apis).icanhazdadjoke).host | quote }}
  TULIP__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.tulip).apis).icanhazdadjoke).path | default "" | quote }}
  TULIP__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.tulip).apis).icanhazdadjoke).port | int | default "" | quote }}
  TULIP__APIS__ICANHAZDADJOKE__SCHEME: {{ required "tulip.apis.icanhazdadjoke.scheme is required" (((.Values.tulip).apis).icanhazdadjoke).scheme | quote }}
  TULIP__DEBUG: {{ required "tulip.debug is required" (.Values.tulip).debug | quote }}
  TULIP__IDENTITY__USERS__DEBUG__ID: {{ required "tulip.identity.users.debug.id is required" ((((.Values.tulip).identity).users).debug).id | quote }}
  TULIP__IDENTITY__USERS__DEBUG__TRAITS__LOCALES__PREFERRED: {{ ((((((.Values.tulip).identity).users).debug).traits).locales).preferred | default "" | quote }}
  TULIP__IDENTITY__USERS__DEBUG__TRAITS__NAMES__DISPLAY: {{ required "tulip.identity.users.debug.traits.names.display is required" ((((((.Values.tulip).identity).users).debug).traits).names).display | quote }}
  TULIP__IDENTITY__USERS__DEBUG__TRAITS__PICTURES__PROFILE__URL: {{ (((((((.Values.tulip).identity).users).debug).traits).pictures).profile).url | default "" | quote }}
  TULIP__SERVER__PORT: {{ required "tulip.server.port is required" ((.Values.tulip).server).port | int | quote }}
  TULIP__URLS__ORCHID__HOST: {{ required "tulip.urls.orchid.host is required" (((.Values.tulip).urls).orchid).host | quote }}
  TULIP__URLS__ORCHID__PATH: {{ (((.Values.tulip).urls).orchid).path | default "" | quote }}
  TULIP__URLS__ORCHID__PORT: {{ (((.Values.tulip).urls).orchid).port | int | default "" | quote }}
  TULIP__URLS__ORCHID__SCHEME: {{ required "tulip.urls.orchid.scheme is required" (((.Values.tulip).urls).orchid).scheme | quote }}
  TULIP__URLS__SUNFLOWER__HOST: {{ required "tulip.urls.sunflower.host is required" (((.Values.tulip).urls).sunflower).host | quote }}
  TULIP__URLS__SUNFLOWER__PATH: {{ (((.Values.tulip).urls).sunflower).path | default "" | quote }}
  TULIP__URLS__SUNFLOWER__PORT: {{ (((.Values.tulip).urls).sunflower).port | int | default "" | quote }}
  TULIP__URLS__SUNFLOWER__SCHEME: {{ required "tulip.urls.sunflower.scheme is required" (((.Values.tulip).urls).sunflower).scheme | quote }}
