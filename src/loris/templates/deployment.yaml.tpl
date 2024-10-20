apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "loris.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "loris.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "loris.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "loris.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/loris:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "loris.server.ports.http is required" (((.Values.loris).server).ports).http | int }}
            - name: whip
              protocol: TCP
              containerPort: {{ required "loris.server.ports.whip is required" (((.Values.loris).server).ports).whip | int }}
            - name: rtp
              protocol: UDP
              containerPort: {{ required "loris.server.ports.rtp is required" (((.Values.loris).server).ports).rtp | int }}
          envFrom:
            - configMapRef:
                name: {{ include "loris.configMapName" . | quote }}
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
