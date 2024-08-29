apiVersion: v1
kind: Service
metadata:
  {{- include "medialounge.serviceMetadata" . | nindent 2 }}
spec:
  clusterIP: None
  selector:
    {{- include "medialounge.selector" . | nindent 4 }}
  ports:
    - name: s3
      protocol: TCP
      port: {{ required "service.ports.s3 is required" ((.Values.service).ports).s3 | int }}
      targetPort: s3
    - name: web
      protocol: TCP
      port: {{ required "service.ports.web is required" ((.Values.service).ports).web | int }}
      targetPort: web
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
