apiVersion: v1
kind: Secret
metadata:
  {{- include "daisy.secretMetadata" . | nindent 2 }}
stringData:
  DAISY__SCORPION__PUBLIC__CLIENT: {{ required "daisy.scorpion.public.client is required" (((.Values.daisy).scorpion).public).client | quote }}
  DAISY__SCORPION__PUBLIC__SECRET: {{ required "daisy.scorpion.public.secret is required" (((.Values.daisy).scorpion).public).secret | quote }}
  DAISY__SECRETS__AUTH: {{ required "daisy.secrets.auth is required" ((.Values.daisy).secrets).auth | join "," | quote }}
