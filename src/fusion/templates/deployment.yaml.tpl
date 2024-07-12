apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "fusion.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "fusion.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "fusion.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "fusion.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/fusion:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: srt
              protocol: UDP
              containerPort: {{ required "app.server.port is required" ((.Values.app).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "fusion.configMapName" . | quote }}
            - secretRef:
                name: {{ include "fusion.secretName" . | quote }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
