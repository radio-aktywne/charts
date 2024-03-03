apiVersion: v1
kind: Service
metadata:
  {{- include "fusion.serviceMetadata" . | nindent 2 }}
spec:
  selector:
    {{- include "fusion.selector" . | nindent 4 }}
  ports:
    - name: srt
      protocol: UDP
      port: {{ required "service.port is required" (.Values.service).port | int }}
      targetPort: srt
  {{- with (.Values.service).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
