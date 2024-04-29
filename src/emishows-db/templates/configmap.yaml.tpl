apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emishows-db.configMapMetadata" . | nindent 2 }}
data:
  EMISHOWS_DB__SERVER__PORTS__SQL: {{ required "database.server.ports.sql is required" (((.Values.database).server).ports).sql | int | quote }}
  EMISHOWS_DB__SERVER__PORTS__HTTP: {{ required "database.server.ports.http is required" (((.Values.database).server).ports).http | int | quote }}
  EMISHOWS_DB__SERVER__PORTS__RPC: {{ required "database.server.ports.rpc is required" (((.Values.database).server).ports).rpc | int | quote }}
