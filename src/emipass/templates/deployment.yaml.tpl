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
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.ports.http is required" (((.Values.app).server).ports).http | int }}
            - name: whip
              protocol: TCP
              containerPort: {{ required "app.server.ports.whip is required" (((.Values.app).server).ports).whip | int }}
            - name: rtp
              protocol: UDP
              containerPort: {{ required "app.server.ports.rtp is required" (((.Values.app).server).ports).rtp | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emipass.configMapName" . | quote }}
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
