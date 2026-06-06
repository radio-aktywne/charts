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
