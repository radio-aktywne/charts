apiVersion: v1
kind: Secret
metadata:
  {{- include "scorpion.secretMetadata" . | nindent 2 }}
stringData:
  SCORPION__SECRETS__SYSTEM: {{ required "scorpion.secrets.system is required" ((.Values.scorpion).secrets).system | join "," | quote }}
  SCORPION__SECRETS__COOKIE: {{ required "scorpion.secrets.cookie is required" ((.Values.scorpion).secrets).cookie | join "," | quote }}
  SCORPION__DIAMOND__SQL__PASSWORD: {{ required "scorpion.diamond.sql.password is required" (((.Values.scorpion).diamond).sql).password | quote }}
