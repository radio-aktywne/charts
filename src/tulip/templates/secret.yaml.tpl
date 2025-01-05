apiVersion: v1
kind: Secret
metadata:
  {{- include "tulip.secretMetadata" . | nindent 2 }}
stringData:
  TULIP__SECRETS__AUTH: {{ required "tulip.secrets.auth is required" ((.Values.tulip).secrets).auth | join "," | quote }}
  TULIP__SCORPION__PUBLIC__CLIENT: {{ required "tulip.scorpion.public.client is required" (((.Values.tulip).scorpion).public).client | quote }}
  TULIP__SCORPION__PUBLIC__SECRET: {{ required "tulip.scorpion.public.secret is required" (((.Values.tulip).scorpion).public).secret | quote }}
