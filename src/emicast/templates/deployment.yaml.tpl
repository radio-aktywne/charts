apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emicast.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emicast.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emicast.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emicast.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emicast:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.port is required" ((.Values.app).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emicast.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emicast.secretName" . | quote }}
          livenessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 6
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
