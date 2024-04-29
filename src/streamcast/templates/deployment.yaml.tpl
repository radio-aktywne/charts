apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "streamcast.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "streamcast.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "streamcast.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "streamcast.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/streamcast:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.port is required" ((.Values.app).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "streamcast.configMapName" . | quote }}
            - secretRef:
                name: {{ include "streamcast.secretName" . | quote }}
          livenessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 30
          readinessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 30
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
