apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "falcon.configMapMetadata" . | nindent 2 }}
data:
  FALCON__SERVER__PORTS__PUBLIC: {{ required "falcon.server.ports.public is required" (((.Values.falcon).server).ports).public | int | quote }}
  FALCON__SERVER__PORTS__ADMIN: {{ required "falcon.server.ports.admin is required" (((.Values.falcon).server).ports).admin | int | quote }}
  FALCON__URLS__PUBLIC: {{ required "falcon.urls.public is required" ((.Values.falcon).urls).public | quote }}
  FALCON__URLS__ADMIN: {{ required "falcon.urls.admin is required" ((.Values.falcon).urls).admin | quote }}
  FALCON__ORCHID__PUBLIC__SCHEME: {{ required "falcon.orchid.public.scheme is required" (((.Values.falcon).orchid).public).scheme | quote }}
  FALCON__ORCHID__PUBLIC__HOST: {{ required "falcon.orchid.public.host is required" (((.Values.falcon).orchid).public).host | quote }}
  FALCON__ORCHID__PUBLIC__PORT: {{ (((.Values.falcon).orchid).public).port | int | default "null" | quote }}
  FALCON__ORCHID__PUBLIC__PATH: {{ (((.Values.falcon).orchid).public).path | default "" | quote }}
  FALCON__OBSIDIAN__SQL__HOST: {{ required "falcon.obsidian.sql.host is required" (((.Values.falcon).obsidian).sql).host | quote }}
  FALCON__OBSIDIAN__SQL__PORT: {{ required "falcon.obsidian.sql.port is required" (((.Values.falcon).obsidian).sql).port | int | quote }}
  FALCON__OIDC__GOOGLE__DOMAIN: {{ (((.Values.falcon).oidc).google).domain | default "" | quote }}
  FALCON__DEBUG: {{ required "falcon.debug is required" (.Values.falcon).debug | quote }}
