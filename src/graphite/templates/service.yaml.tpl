apiVersion: v1
kind: Service
metadata:
  {{- include "graphite.serviceMetadata" . | nindent 2 }}
spec:
  clusterIP: None
  selector:
    {{- include "graphite.selector" . | nindent 4 }}
  ports:
    - name: sql
      protocol: TCP
      port: {{ required "service.port is required" (.Values.service).port | int }}
      targetPort: sql
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
