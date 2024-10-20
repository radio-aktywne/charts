apiVersion: v1
kind: Service
metadata:
  {{- include "octopus.serviceMetadata" . | nindent 2 }}
spec:
  selector:
    {{- include "octopus.selector" . | nindent 4 }}
  ports:
    - name: http
      protocol: TCP
      port: {{ required "service.ports.http is required" ((.Values.service).ports).http | int }}
      targetPort: http
    - name: srt
      protocol: UDP
      port: {{ required "service.ports.srt is required" ((.Values.service).ports).srt | int }}
      targetPort: srt
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
