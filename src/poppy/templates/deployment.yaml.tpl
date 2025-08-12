apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "poppy.deploymentMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "poppy.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "poppy.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "poppy.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/poppy:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "poppy.server.port is required" ((.Values.poppy).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "poppy.configMapName" . | quote }}
            - secretRef:
                name: {{ include "poppy.secretName" . | quote }}
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
