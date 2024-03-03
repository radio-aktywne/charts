apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "streamcast.deploymentMetadata" . | nindent 2 }}
spec:
  {{- if (.Values.deployment).replicas }}
  replicas: {{ (.Values.deployment).replicas | int }}
  {{- end }}
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
              containerPort: {{ required "app.port is required" (.Values.app).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "streamcast.configMapName" . | quote }}
            - secretRef:
                name: {{ include "streamcast.secretName" . | quote }}
          livenessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 9
          readinessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 3
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
