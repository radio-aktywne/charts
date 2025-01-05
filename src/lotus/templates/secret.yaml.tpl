apiVersion: v1
kind: Secret
metadata:
  {{- include "lotus.secretMetadata" . | nindent 2 }}
stringData:
  LOTUS__SECRETS__AUTH: {{ required "lotus.secrets.auth is required" ((.Values.lotus).secrets).auth | join "," | quote }}
  LOTUS__SCORPION__PUBLIC__CLIENT: {{ required "lotus.scorpion.public.client is required" (((.Values.lotus).scorpion).public).client | quote }}
  LOTUS__SCORPION__PUBLIC__SECRET: {{ required "lotus.scorpion.public.secret is required" (((.Values.lotus).scorpion).public).secret | quote }}
