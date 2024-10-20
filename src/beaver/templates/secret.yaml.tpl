apiVersion: v1
kind: Secret
metadata:
  {{- include "beaver.secretMetadata" . | nindent 2 }}
stringData:
  BEAVER__HOWLITE__CALDAV__USER: {{ required "beaver.howlite.caldav.user is required" (((.Values.beaver).howlite).caldav).user | quote }}
  BEAVER__HOWLITE__CALDAV__PASSWORD: {{ required "beaver.howlite.caldav.password is required" (((.Values.beaver).howlite).caldav).password | quote }}
  BEAVER__SAPPHIRE__SQL__PASSWORD: {{ required "beaver.sapphire.sql.password is required" (((.Values.beaver).sapphire).sql).password | quote }}
