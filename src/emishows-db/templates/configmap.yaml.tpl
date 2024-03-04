apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emishows-db.configMapMetadata" . | nindent 2 }}
data:
  EMISHOWS_DB_SQL_PORT: {{ required "database.ports.sql is required" ((.Values.database).ports).sql | int | quote }}
  EMISHOWS_DB_HTTP_PORT: {{ required "database.ports.http is required" ((.Values.database).ports).http | int | quote }}
  EMISHOWS_DB_RPC_PORT: {{ required "database.ports.rpc is required" ((.Values.database).ports).rpc | int | quote }}
