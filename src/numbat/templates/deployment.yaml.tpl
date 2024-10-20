apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "numbat.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "numbat.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "numbat.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "numbat.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/numbat:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "numbat.server.port is required" ((.Values.numbat).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "numbat.configMapName" . | quote }}
            - secretRef:
                name: {{ include "numbat.secretName" . | quote }}
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
