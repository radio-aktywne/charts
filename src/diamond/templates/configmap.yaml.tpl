apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "diamond.configMapMetadata" . | nindent 2 }}
data:
  DIAMOND__SERVER__PORTS__SQL: {{ required "diamond.server.ports.sql is required" (((.Values.diamond).server).ports).sql | int | quote }}
  DIAMOND__SERVER__PORTS__HTTP: {{ required "diamond.server.ports.http is required" (((.Values.diamond).server).ports).http | int | quote }}
  DIAMOND__SERVER__PORTS__RPC: {{ required "diamond.server.ports.rpc is required" (((.Values.diamond).server).ports).rpc | int | quote }}
