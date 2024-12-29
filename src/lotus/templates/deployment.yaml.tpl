apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "lotus.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "lotus.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "lotus.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "lotus.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/lotus:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "lotus.server.port is required" ((.Values.lotus).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "lotus.configMapName" . | quote }}
          livenessProbe:
            httpGet:
              path: /ping
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /ping
              port: http
            failureThreshold: 6
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
