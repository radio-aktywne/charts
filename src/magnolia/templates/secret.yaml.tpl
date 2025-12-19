apiVersion: v1
kind: Secret
metadata:
  {{- include "magnolia.secretMetadata" . | nindent 2 }}
stringData:
  MAGNOLIA__SCORPION__PUBLIC__CLIENT: {{ required "magnolia.scorpion.public.client is required" (((.Values.magnolia).scorpion).public).client | quote }}
  MAGNOLIA__SCORPION__PUBLIC__SECRET: {{ required "magnolia.scorpion.public.secret is required" (((.Values.magnolia).scorpion).public).secret | quote }}
  MAGNOLIA__SECRETS__AUTH: {{ required "magnolia.secrets.auth is required" ((.Values.magnolia).secrets).auth | join "," | quote }}
