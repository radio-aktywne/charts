apiVersion: v1
kind: Service
metadata:
  {{- include "sapphire.serviceMetadata" . | nindent 2 }}
spec:
  clusterIP: None
  selector:
    {{- include "sapphire.selector" . | nindent 4 }}
  ports:
    - name: sql
      protocol: TCP
      port: {{ required "service.ports.sql is required" ((.Values.service).ports).sql | int }}
      targetPort: sql
    - name: http
      protocol: TCP
      port: {{ required "service.ports.http is required" ((.Values.service).ports).http | int }}
      targetPort: http
    - name: rpc
      protocol: TCP
      port: {{ required "service.ports.rpc is required" ((.Values.service).ports).rpc | int }}
      targetPort: rpc
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
