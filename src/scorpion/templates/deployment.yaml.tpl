apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "scorpion.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "scorpion.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "scorpion.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "scorpion.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/scorpion:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: public
              protocol: TCP
              containerPort: {{ required "scorpion.server.ports.public is required" (((.Values.scorpion).server).ports).public | int }}
            - name: admin
              protocol: TCP
              containerPort: {{ required "scorpion.server.ports.admin is required" (((.Values.scorpion).server).ports).admin | int }}
          envFrom:
            - configMapRef:
                name: {{ include "scorpion.configMapName" . | quote }}
            - secretRef:
                name: {{ include "scorpion.secretName" . | quote }}
          livenessProbe:
            httpGet:
              path: /health/alive
              port: admin
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /health/alive
              port: admin
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
