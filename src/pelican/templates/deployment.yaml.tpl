apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "pelican.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "pelican.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "pelican.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "pelican.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/pelican:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "pelican.server.port is required" ((.Values.pelican).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "pelican.configMapName" . | quote }}
            - secretRef:
                name: {{ include "pelican.secretName" . | quote }}
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
