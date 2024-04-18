apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emiweb.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emiweb.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emiweb.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emiweb.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emiweb:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.port is required" (.Values.app).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emiweb.configMapName" . | quote }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
