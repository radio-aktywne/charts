apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "sunflower.deploymentMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "sunflower.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "sunflower.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "sunflower.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/sunflower:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "sunflower.server.port is required" ((.Values.sunflower).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "sunflower.configMapName" . | quote }}
          livenessProbe:
            httpGet:
              path: /api/ping
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /api/ping
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
