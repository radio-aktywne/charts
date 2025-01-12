apiVersion: v1
kind: Secret
metadata:
  {{- include "obsidian.secretMetadata" . | nindent 2 }}
stringData:
  OBSIDIAN__CREDENTIALS__ROOT__PASSWORD: {{ required "obsidian.credentials.root.password is required" (((.Values.obsidian).credentials).root).password | quote }}
  OBSIDIAN__CREDENTIALS__USER__PASSWORD: {{ required "obsidian.credentials.user.password is required" (((.Values.obsidian).credentials).user).password | quote }}
