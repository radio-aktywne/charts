apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "aster.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "aster.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "aster.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "aster.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/aster:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "aster.server.port is required" ((.Values.aster).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "aster.configMapName" . | quote }}
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
