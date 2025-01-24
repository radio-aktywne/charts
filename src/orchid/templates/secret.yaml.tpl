apiVersion: v1
kind: Secret
metadata:
  {{- include "orchid.secretMetadata" . | nindent 2 }}
stringData:
  ORCHID__SECRETS__SHARED: {{ required "orchid.secrets.shared is required" ((.Values.orchid).secrets).shared | quote }}
