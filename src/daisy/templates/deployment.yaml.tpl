apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "daisy.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "daisy.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "daisy.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "daisy.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/daisy:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "daisy.server.port is required" ((.Values.daisy).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "daisy.configMapName" . | quote }}
            - secretRef:
                name: {{ include "daisy.secretName" . | quote }}
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
          {{- with (.Values.container).spec }}
          {{- toYaml . | nindent 10 }}
          {{- end }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
