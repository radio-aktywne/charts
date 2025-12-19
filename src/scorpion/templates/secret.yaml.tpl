apiVersion: v1
kind: Secret
metadata:
  {{- include "scorpion.secretMetadata" . | nindent 2 }}
stringData:
  SCORPION__CLIENTS__ASTER__SECRET: {{ required "scorpion.clients.aster.secret is required" ((.Values.scorpion).clients).aster.secret | quote }}
  SCORPION__CLIENTS__DAISY__SECRET: {{ required "scorpion.clients.daisy.secret is required" ((.Values.scorpion).clients).daisy.secret | quote }}
  SCORPION__CLIENTS__JASMINE__SECRET: {{ required "scorpion.clients.jasmine.secret is required" ((.Values.scorpion).clients).jasmine.secret | quote }}
  SCORPION__CLIENTS__LOTUS__SECRET: {{ required "scorpion.clients.lotus.secret is required" ((.Values.scorpion).clients).lotus.secret | quote }}
  SCORPION__CLIENTS__MAGNOLIA__SECRET: {{ required "scorpion.clients.magnolia.secret is required" ((.Values.scorpion).clients).magnolia.secret | quote }}
  SCORPION__CLIENTS__POPPY__SECRET: {{ required "scorpion.clients.poppy.secret is required" ((.Values.scorpion).clients).poppy.secret | quote }}
  SCORPION__CLIENTS__TULIP__SECRET: {{ required "scorpion.clients.tulip.secret is required" ((.Values.scorpion).clients).tulip.secret | quote }}
  SCORPION__DIAMOND__SQL__PASSWORD: {{ required "scorpion.diamond.sql.password is required" (((.Values.scorpion).diamond).sql).password | quote }}
  SCORPION__SECRETS__COOKIE: {{ required "scorpion.secrets.cookie is required" ((.Values.scorpion).secrets).cookie | join "," | quote }}
  SCORPION__SECRETS__SYSTEM: {{ required "scorpion.secrets.system is required" ((.Values.scorpion).secrets).system | join "," | quote }}
