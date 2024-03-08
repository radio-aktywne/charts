apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emischeduler.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emischeduler.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emischeduler.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emischeduler.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emischeduler:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.port is required" (.Values.app).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emischeduler.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emischeduler.secretName" . | quote }}
          livenessProbe:
            httpGet:
              path: /ping
              port: http
            failureThreshold: 30
          readinessProbe:
            httpGet:
              path: /ping
              port: http
            failureThreshold: 30
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
