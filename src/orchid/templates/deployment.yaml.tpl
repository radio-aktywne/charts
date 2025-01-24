apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "orchid.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "orchid.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "orchid.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "orchid.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/orchid:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "orchid.server.port is required" ((.Values.orchid).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "orchid.configMapName" . | quote }}
            - secretRef:
                name: {{ include "orchid.secretName" . | quote }}
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
