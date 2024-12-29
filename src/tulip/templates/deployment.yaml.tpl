apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "tulip.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "tulip.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "tulip.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "tulip.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/tulip:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "tulip.server.port is required" ((.Values.tulip).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "tulip.configMapName" . | quote }}
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
