apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emipass.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emipass.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emipass.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emipass.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emipass:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.ports.http is required" ((.Values.app).ports).http | int }}
            - name: whip
              protocol: TCP
              containerPort: {{ required "app.ports.whip is required" ((.Values.app).ports).whip | int }}
            - name: rtp
              protocol: UDP
              containerPort: {{ required "app.ports.rtp is required" ((.Values.app).ports).rtp | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emipass.configMapName" . | quote }}
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
