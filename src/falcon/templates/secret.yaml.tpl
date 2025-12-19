apiVersion: v1
kind: Secret
metadata:
  {{- include "falcon.secretMetadata" . | nindent 2 }}
stringData:
  FALCON__OBSIDIAN__SQL__PASSWORD: {{ required "falcon.obsidian.sql.password is required" (((.Values.falcon).obsidian).sql).password | quote }}
  FALCON__OIDC__GOOGLE__CLIENT: {{ required "falcon.oidc.google.client is required" (((.Values.falcon).oidc).google).client | quote }}
  FALCON__OIDC__GOOGLE__SECRET: {{ required "falcon.oidc.google.secret is required" (((.Values.falcon).oidc).google).secret | quote }}
  FALCON__SECRETS__CIPHER: {{ required "falcon.secrets.cipher is required" ((.Values.falcon).secrets).cipher | join "," | quote }}
  FALCON__SECRETS__COOKIE: {{ required "falcon.secrets.cookie is required" ((.Values.falcon).secrets).cookie | join "," | quote }}
  FALCON__SECRETS__DEFAULT: {{ required "falcon.secrets.default is required" ((.Values.falcon).secrets).default | join "," | quote }}
