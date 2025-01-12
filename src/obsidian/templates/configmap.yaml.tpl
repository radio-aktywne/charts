apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "obsidian.configMapMetadata" . | nindent 2 }}
data:
  OBSIDIAN__SERVER__PORTS__SQL: {{ required "obsidian.server.ports.sql is required" (((.Values.obsidian).server).ports).sql | int | quote }}
  OBSIDIAN__SERVER__PORTS__HTTP: {{ required "obsidian.server.ports.http is required" (((.Values.obsidian).server).ports).http | int | quote }}
  OBSIDIAN__SERVER__PORTS__RPC: {{ required "obsidian.server.ports.rpc is required" (((.Values.obsidian).server).ports).rpc | int | quote }}
