apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "crocus.deploymentMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "crocus.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "crocus.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "crocus.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/crocus:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "crocus.server.port is required" ((.Values.crocus).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "crocus.configMapName" . | quote }}
            - secretRef:
                name: {{ include "crocus.secretName" . | quote }}
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
