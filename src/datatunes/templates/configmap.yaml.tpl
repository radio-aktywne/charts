apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "datatunes.configMapMetadata" . | nindent 2 }}
data:
  DATATUNES__SERVER__PORTS__SQL: {{ required "database.server.ports.sql is required" (((.Values.database).server).ports).sql | int | quote }}
  DATATUNES__SERVER__PORTS__HTTP: {{ required "database.server.ports.http is required" (((.Values.database).server).ports).http | int | quote }}
  DATATUNES__SERVER__PORTS__RPC: {{ required "database.server.ports.rpc is required" (((.Values.database).server).ports).rpc | int | quote }}
