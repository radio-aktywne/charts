apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "sapphire.configMapMetadata" . | nindent 2 }}
data:
  SAPPHIRE__SERVER__PORTS__SQL: {{ required "sapphire.server.ports.sql is required" (((.Values.sapphire).server).ports).sql | int | quote }}
  SAPPHIRE__SERVER__PORTS__HTTP: {{ required "sapphire.server.ports.http is required" (((.Values.sapphire).server).ports).http | int | quote }}
  SAPPHIRE__SERVER__PORTS__RPC: {{ required "sapphire.server.ports.rpc is required" (((.Values.sapphire).server).ports).rpc | int | quote }}
