apiVersion: v1
kind: Service
metadata:
  {{- include "pelican.serviceMetadata" . | nindent 2 }}
spec:
  selector:
    {{- include "pelican.selector" . | nindent 4 }}
  ports:
    - name: http
      protocol: TCP
      port: {{ required "service.port is required" (.Values.service).port | int }}
      targetPort: http
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
