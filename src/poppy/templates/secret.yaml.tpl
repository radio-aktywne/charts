apiVersion: v1
kind: Secret
metadata:
  {{- include "poppy.secretMetadata" . | nindent 2 }}
stringData:
  POPPY__SCORPION__PUBLIC__CLIENT: {{ required "poppy.scorpion.public.client is required" (((.Values.poppy).scorpion).public).client | quote }}
  POPPY__SCORPION__PUBLIC__SECRET: {{ required "poppy.scorpion.public.secret is required" (((.Values.poppy).scorpion).public).secret | quote }}
  POPPY__SECRETS__AUTH: {{ required "poppy.secrets.auth is required" ((.Values.poppy).secrets).auth | join "," | quote }}
