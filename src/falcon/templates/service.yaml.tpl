apiVersion: v1
kind: Service
metadata:
  {{- include "falcon.serviceMetadata" . | nindent 2 }}
spec:
  selector:
    {{- include "falcon.selector" . | nindent 4 }}
  ports:
    - name: public
      protocol: TCP
      port: {{ required "service.ports.public is required" ((.Values.service).ports).public | int }}
      targetPort: public
    - name: admin
      protocol: TCP
      port: {{ required "service.ports.admin is required" ((.Values.service).ports).admin | int }}
      targetPort: admin
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
