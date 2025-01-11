apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "gecko.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "gecko.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "gecko.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "gecko.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/gecko:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "gecko.server.port is required" ((.Values.gecko).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "gecko.configMapName" . | quote }}
            - secretRef:
                name: {{ include "gecko.secretName" . | quote }}
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
