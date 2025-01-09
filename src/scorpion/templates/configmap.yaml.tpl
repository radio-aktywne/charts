apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "scorpion.configMapMetadata" . | nindent 2 }}
data:
  SCORPION__SERVER__PORTS__PUBLIC: {{ required "scorpion.server.ports.public is required" (((.Values.scorpion).server).ports).public | int | quote }}
  SCORPION__SERVER__PORTS__ADMIN: {{ required "scorpion.server.ports.admin is required" (((.Values.scorpion).server).ports).admin | int | quote }}
  SCORPION__URLS__ISSUER: {{ required "scorpion.urls.issuer is required" ((.Values.scorpion).urls).issuer | quote }}
  SCORPION__URLS__PUBLIC: {{ required "scorpion.urls.public is required" ((.Values.scorpion).urls).public | quote }}
  SCORPION__URLS__ADMIN: {{ required "scorpion.urls.admin is required" ((.Values.scorpion).urls).admin | quote }}
  SCORPION__CROCUS__PUBLIC__SCHEME: {{ required "scorpion.crocus.public.scheme is required" (((.Values.scorpion).crocus).public).scheme | quote }}
  SCORPION__CROCUS__PUBLIC__HOST: {{ required "scorpion.crocus.public.host is required" (((.Values.scorpion).crocus).public).host | quote }}
  SCORPION__CROCUS__PUBLIC__PORT: {{ (((.Values.scorpion).crocus).public).port | int | default "null" | quote }}
  SCORPION__CROCUS__PUBLIC__PATH: {{ (((.Values.scorpion).crocus).public).path | default "" | quote }}
  SCORPION__DIAMOND__SQL__HOST: {{ required "scorpion.diamond.sql.host is required" (((.Values.scorpion).diamond).sql).host | quote }}
  SCORPION__DIAMOND__SQL__PORT: {{ required "scorpion.diamond.sql.port is required" (((.Values.scorpion).diamond).sql).port | int | quote }}
  SCORPION__CLIENTS__ASTER__URL: {{ required "scorpion.clients.aster.url is required" ((.Values.scorpion).clients).aster.url | quote }}
  SCORPION__CLIENTS__DAISY__URL: {{ required "scorpion.clients.daisy.url is required" ((.Values.scorpion).clients).daisy.url | quote }}
  SCORPION__CLIENTS__JASMINE__URL: {{ required "scorpion.clients.jasmine.url is required" ((.Values.scorpion).clients).jasmine.url | quote }}
  SCORPION__CLIENTS__LOTUS__URL: {{ required "scorpion.clients.lotus.url is required" ((.Values.scorpion).clients).lotus.url | quote }}
  SCORPION__CLIENTS__MAGNOLIA__URL: {{ required "scorpion.clients.magnolia.url is required" ((.Values.scorpion).clients).magnolia.url | quote }}
  SCORPION__CLIENTS__POPPY__URL: {{ required "scorpion.clients.poppy.url is required" ((.Values.scorpion).clients).poppy.url | quote }}
  SCORPION__CLIENTS__TULIP__URL: {{ required "scorpion.clients.tulip.url is required" ((.Values.scorpion).clients).tulip.url | quote }}
  SCORPION__DEBUG: {{ required "scorpion.debug is required" (.Values.scorpion).debug | quote }}
