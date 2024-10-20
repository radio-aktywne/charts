apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "graphite.configMapMetadata" . | nindent 2 }}
data:
  GRAPHITE__SERVER__PORTS__SQL: {{ required "graphite.server.ports.sql is required" (((.Values.graphite).server).ports).sql | int | quote }}
  GRAPHITE__SERVER__PORTS__HTTP: {{ required "graphite.server.ports.http is required" (((.Values.graphite).server).ports).http | int | quote }}
  GRAPHITE__SERVER__PORTS__RPC: {{ required "graphite.server.ports.rpc is required" (((.Values.graphite).server).ports).rpc | int | quote }}
