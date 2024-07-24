apiVersion: v1
kind: Service
metadata:
  {{- include "fusion.serviceMetadata" . | nindent 2 }}
spec:
  clusterIP: None
  selector:
    {{- include "fusion.selector" . | nindent 4 }}
  ports:
    - name: srt
      protocol: UDP
      port: {{ required "service.ports.srt is required" ((.Values.service).ports).srt | int }}
      targetPort: srt
    - name: http
      protocol: TCP
      port: {{ required "service.ports.http is required" ((.Values.service).ports).http | int }}
      targetPort: http
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
