apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emistream.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emistream.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emistream.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emistream.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emistream:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.ports.http is required" ((.Values.app).ports).http | int }}
            - name: srt
              protocol: UDP
              containerPort: {{ required "app.ports.srt is required" ((.Values.app).ports).srt | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emistream.configMapName" . | quote }}
          livenessProbe:
            httpGet:
              path: /ping
              port: http
            failureThreshold: 30
          readinessProbe:
            httpGet:
              path: /ping
              port: http
            failureThreshold: 30
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
