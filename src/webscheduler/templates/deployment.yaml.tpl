apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "webscheduler.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "webscheduler.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "webscheduler.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "webscheduler.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/webscheduler:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.port is required" ((.Values.app).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "webscheduler.configMapName" . | quote }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
