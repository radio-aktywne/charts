apiVersion: v1
kind: Secret
metadata:
  {{- include "quokka.secretMetadata" . | nindent 2 }}
stringData:
  QUOKKA__CREDENTIALS__SOURCE__USER: {{ required "quokka.credentials.source.user is required" (((.Values.quokka).credentials).source).user | quote }}
  QUOKKA__CREDENTIALS__SOURCE__PASSWORD: {{ required "quokka.credentials.source.password is required" (((.Values.quokka).credentials).source).password | quote }}
  QUOKKA__CREDENTIALS__ADMIN__USER: {{ required "quokka.credentials.admin.user is required" (((.Values.quokka).credentials).admin).user | quote }}
  QUOKKA__CREDENTIALS__ADMIN__PASSWORD: {{ required "quokka.credentials.admin.password is required" (((.Values.quokka).credentials).admin).password | quote }}
