apiVersion: v1
kind: Service
metadata:
  {{- include "emipass.serviceMetadata" . | nindent 2 }}
spec:
  selector:
    {{- include "emipass.selector" . | nindent 4 }}
  ports:
    - name: http
      protocol: TCP
      port: {{ required "service.ports.http is required" ((.Values.service).ports).http | int }}
      targetPort: http
    - name: whip
      protocol: TCP
      port: {{ required "service.ports.whip is required" ((.Values.service).ports).whip | int }}
      targetPort: whip
    - name: rtp
      protocol: UDP
      port: {{ required "service.ports.rtp is required" ((.Values.service).ports).rtp | int }}
      targetPort: rtp
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
