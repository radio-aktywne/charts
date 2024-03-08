apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "emirecorder.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emirecorder.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emirecorder.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emirecorder.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emirecorder:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "app.ports.http is required" ((.Values.app).ports).http | int }}
            - name: srt
              protocol: UDP
              containerPort: {{ required "app.ports.srt is required" ((.Values.app).ports).srt | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emirecorder.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emirecorder.secretName" . | quote }}
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
