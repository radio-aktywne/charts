apiVersion: v1
kind: Secret
metadata:
  {{- include "jasmine.secretMetadata" . | nindent 2 }}
stringData:
  JASMINE__SECRETS__AUTH: {{ required "jasmine.secrets.auth is required" ((.Values.jasmine).secrets).auth | join "," | quote }}
  JASMINE__SCORPION__PUBLIC__CLIENT: {{ required "jasmine.scorpion.public.client is required" (((.Values.jasmine).scorpion).public).client | quote }}
  JASMINE__SCORPION__PUBLIC__SECRET: {{ required "jasmine.scorpion.public.secret is required" (((.Values.jasmine).scorpion).public).secret | quote }}
