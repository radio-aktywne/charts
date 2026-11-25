apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "daisy.configMapMetadata" . | nindent 2 }}
data:
  DAISY__APIS__ICANHAZDADJOKE__HOST: {{ required "daisy.apis.icanhazdadjoke.host is required" (((.Values.daisy).apis).icanhazdadjoke).host | quote }}
  DAISY__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.daisy).apis).icanhazdadjoke).path | default "" | quote }}
  DAISY__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.daisy).apis).icanhazdadjoke).port | int | default "" | quote }}
  DAISY__APIS__ICANHAZDADJOKE__SCHEME: {{ required "daisy.apis.icanhazdadjoke.scheme is required" (((.Values.daisy).apis).icanhazdadjoke).scheme | quote }}
  DAISY__APIS__MANTIS__HOST: {{ required "daisy.apis.mantis.host is required" (((.Values.daisy).apis).mantis).host | quote }}
  DAISY__APIS__MANTIS__PATH: {{ (((.Values.daisy).apis).mantis).path | default "" | quote }}
  DAISY__APIS__MANTIS__PORT: {{ (((.Values.daisy).apis).mantis).port | int | default "" | quote }}
  DAISY__APIS__MANTIS__SCHEME: {{ required "daisy.apis.mantis.scheme is required" (((.Values.daisy).apis).mantis).scheme | quote }}
  DAISY__DEBUG: {{ required "daisy.debug is required" (.Values.daisy).debug | quote }}
  DAISY__IDENTITY__USERS__DEBUG__ID: {{ required "daisy.identity.users.debug.id is required" ((((.Values.daisy).identity).users).debug).id | quote }}
  DAISY__IDENTITY__USERS__DEBUG__TRAITS__LOCALES__PREFERRED: {{ ((((((.Values.daisy).identity).users).debug).traits).locales).preferred | default "" | quote }}
  DAISY__IDENTITY__USERS__DEBUG__TRAITS__NAMES__DISPLAY: {{ required "daisy.identity.users.debug.traits.names.display is required" ((((((.Values.daisy).identity).users).debug).traits).names).display | quote }}
  DAISY__IDENTITY__USERS__DEBUG__TRAITS__PICTURES__PROFILE__URL: {{ (((((((.Values.daisy).identity).users).debug).traits).pictures).profile).url | default "" | quote }}
  DAISY__SERVER__PORT: {{ required "daisy.server.port is required" ((.Values.daisy).server).port | int | quote }}
  DAISY__URLS__ORCHID__HOST: {{ required "daisy.urls.orchid.host is required" (((.Values.daisy).urls).orchid).host | quote }}
  DAISY__URLS__ORCHID__PATH: {{ (((.Values.daisy).urls).orchid).path | default "" | quote }}
  DAISY__URLS__ORCHID__PORT: {{ (((.Values.daisy).urls).orchid).port | int | default "" | quote }}
  DAISY__URLS__ORCHID__SCHEME: {{ required "daisy.urls.orchid.scheme is required" (((.Values.daisy).urls).orchid).scheme | quote }}
  DAISY__URLS__SUNFLOWER__HOST: {{ required "daisy.urls.sunflower.host is required" (((.Values.daisy).urls).sunflower).host | quote }}
  DAISY__URLS__SUNFLOWER__PATH: {{ (((.Values.daisy).urls).sunflower).path | default "" | quote }}
  DAISY__URLS__SUNFLOWER__PORT: {{ (((.Values.daisy).urls).sunflower).port | int | default "" | quote }}
  DAISY__URLS__SUNFLOWER__SCHEME: {{ required "daisy.urls.sunflower.scheme is required" (((.Values.daisy).urls).sunflower).scheme | quote }}
