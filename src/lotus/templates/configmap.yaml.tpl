apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "lotus.configMapMetadata" . | nindent 2 }}
data:
  LOTUS__APIS__ICANHAZDADJOKE__HOST: {{ required "lotus.apis.icanhazdadjoke.host is required" (((.Values.lotus).apis).icanhazdadjoke).host | quote }}
  LOTUS__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.lotus).apis).icanhazdadjoke).path | default "" | quote }}
  LOTUS__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.lotus).apis).icanhazdadjoke).port | int | default "" | quote }}
  LOTUS__APIS__ICANHAZDADJOKE__SCHEME: {{ required "lotus.apis.icanhazdadjoke.scheme is required" (((.Values.lotus).apis).icanhazdadjoke).scheme | quote }}
  LOTUS__APIS__PELICAN__HOST: {{ required "lotus.apis.pelican.host is required" (((.Values.lotus).apis).pelican).host | quote }}
  LOTUS__APIS__PELICAN__PATH: {{ (((.Values.lotus).apis).pelican).path | default "" | quote }}
  LOTUS__APIS__PELICAN__PORT: {{ (((.Values.lotus).apis).pelican).port | int | default "" | quote }}
  LOTUS__APIS__PELICAN__SCHEME: {{ required "lotus.apis.pelican.scheme is required" (((.Values.lotus).apis).pelican).scheme | quote }}
  LOTUS__DEBUG: {{ required "lotus.debug is required" (.Values.lotus).debug | quote }}
  LOTUS__IDENTITY__USERS__DEBUG__ID: {{ required "lotus.identity.users.debug.id is required" ((((.Values.lotus).identity).users).debug).id | quote }}
  LOTUS__IDENTITY__USERS__DEBUG__TRAITS__LOCALES__PREFERRED: {{ ((((((.Values.lotus).identity).users).debug).traits).locales).preferred | default "" | quote }}
  LOTUS__IDENTITY__USERS__DEBUG__TRAITS__NAMES__DISPLAY: {{ required "lotus.identity.users.debug.traits.names.display is required" ((((((.Values.lotus).identity).users).debug).traits).names).display | quote }}
  LOTUS__IDENTITY__USERS__DEBUG__TRAITS__PICTURES__PROFILE__URL: {{ (((((((.Values.lotus).identity).users).debug).traits).pictures).profile).url | default "" | quote }}
  LOTUS__SERVER__PORT: {{ required "lotus.server.port is required" ((.Values.lotus).server).port | int | quote }}
  LOTUS__URLS__ORCHID__HOST: {{ required "lotus.urls.orchid.host is required" (((.Values.lotus).urls).orchid).host | quote }}
  LOTUS__URLS__ORCHID__PATH: {{ (((.Values.lotus).urls).orchid).path | default "" | quote }}
  LOTUS__URLS__ORCHID__PORT: {{ (((.Values.lotus).urls).orchid).port | int | default "" | quote }}
  LOTUS__URLS__ORCHID__SCHEME: {{ required "lotus.urls.orchid.scheme is required" (((.Values.lotus).urls).orchid).scheme | quote }}
  LOTUS__URLS__SUNFLOWER__HOST: {{ required "lotus.urls.sunflower.host is required" (((.Values.lotus).urls).sunflower).host | quote }}
  LOTUS__URLS__SUNFLOWER__PATH: {{ (((.Values.lotus).urls).sunflower).path | default "" | quote }}
  LOTUS__URLS__SUNFLOWER__PORT: {{ (((.Values.lotus).urls).sunflower).port | int | default "" | quote }}
  LOTUS__URLS__SUNFLOWER__SCHEME: {{ required "lotus.urls.sunflower.scheme is required" (((.Values.lotus).urls).sunflower).scheme | quote }}
