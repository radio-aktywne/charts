apiVersion: v1
kind: Secret
metadata:
  {{- include "dingo.secretMetadata" . | nindent 2 }}
stringData:
  DINGO__QUOKKA__ICY__PASSWORD: {{ required "dingo.quokka.icy.password is required" (((.Values.dingo).quokka).icy).password | quote }}
  DINGO__QUOKKA__ICY__USER: {{ required "dingo.quokka.icy.user is required" (((.Values.dingo).quokka).icy).user | quote }}
