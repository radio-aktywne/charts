apiVersion: v1
kind: Secret
metadata:
  {{- include "aster.secretMetadata" . | nindent 2 }}
stringData:
  ASTER__SCORPION__PUBLIC__CLIENT: {{ required "aster.scorpion.public.client is required" (((.Values.aster).scorpion).public).client | quote }}
  ASTER__SCORPION__PUBLIC__SECRET: {{ required "aster.scorpion.public.secret is required" (((.Values.aster).scorpion).public).secret | quote }}
  ASTER__SECRETS__AUTH: {{ required "aster.secrets.auth is required" ((.Values.aster).secrets).auth | join "," | quote }}
