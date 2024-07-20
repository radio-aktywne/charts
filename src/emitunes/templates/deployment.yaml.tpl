apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emitunes.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emitunes.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emitunes.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emitunes.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emitunes:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.port is required" ((.Values.app).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emitunes.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emitunes.secretName" . | quote }}
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
