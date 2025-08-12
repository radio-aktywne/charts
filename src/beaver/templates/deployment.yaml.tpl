apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "beaver.deploymentMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "beaver.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "beaver.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "beaver.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/beaver:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "beaver.server.port is required" ((.Values.beaver).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "beaver.configMapName" . | quote }}
            - secretRef:
                name: {{ include "beaver.secretName" . | quote }}
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
