apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "octopus.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "octopus.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "octopus.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "octopus.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/octopus:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "octopus.server.ports.http is required" (((.Values.octopus).server).ports).http | int }}
            - name: srt
              protocol: UDP
              containerPort: {{ required "octopus.server.ports.srt is required" (((.Values.octopus).server).ports).srt | int }}
          envFrom:
            - configMapRef:
                name: {{ include "octopus.configMapName" . | quote }}
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
