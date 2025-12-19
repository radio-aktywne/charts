apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "beaver.configMapMetadata" . | nindent 2 }}
data:
  BEAVER__DEBUG: {{ required "beaver.debug is required" (.Values.beaver).debug | quote }}
  BEAVER__HOWLITE__CALDAV__CALENDAR: {{ required "beaver.howlite.caldav.calendar is required" (((.Values.beaver).howlite).caldav).calendar | quote }}
  BEAVER__HOWLITE__CALDAV__HOST: {{ required "beaver.howlite.caldav.host is required" (((.Values.beaver).howlite).caldav).host | quote }}
  BEAVER__HOWLITE__CALDAV__PATH: {{ (((.Values.beaver).howlite).caldav).path | default "" | quote }}
  BEAVER__HOWLITE__CALDAV__PORT: {{ (((.Values.beaver).howlite).caldav).port | int | default "" | quote }}
  BEAVER__HOWLITE__CALDAV__SCHEME: {{ required "beaver.howlite.caldav.scheme is required" (((.Values.beaver).howlite).caldav).scheme | quote }}
  BEAVER__SAPPHIRE__SQL__HOST: {{ required "beaver.sapphire.sql.host is required" (((.Values.beaver).sapphire).sql).host | quote }}
  BEAVER__SAPPHIRE__SQL__PORT: {{ required "beaver.sapphire.sql.port is required" (((.Values.beaver).sapphire).sql).port | int | quote }}
  BEAVER__SERVER__PORT: {{ required "beaver.server.port is required" ((.Values.beaver).server).port | int | quote }}
