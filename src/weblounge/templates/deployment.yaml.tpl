apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "weblounge.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "weblounge.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "weblounge.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "weblounge.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/weblounge:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.port is required" ((.Values.app).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "weblounge.configMapName" . | quote }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
