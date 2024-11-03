apiVersion: v1
kind: Secret
metadata:
  {{- include "crocus.secretMetadata" . | nindent 2 }}
stringData:
  CROCUS__SECRETS__SHARED: {{ required "crocus.secrets.shared is required" ((.Values.crocus).secrets).shared | quote }}
