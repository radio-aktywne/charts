apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "falcon.deploymentMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "falcon.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "falcon.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "falcon.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/falcon:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: public
              protocol: TCP
              containerPort: {{ required "falcon.server.ports.public is required" (((.Values.falcon).server).ports).public | int }}
            - name: admin
              protocol: TCP
              containerPort: {{ required "falcon.server.ports.admin is required" (((.Values.falcon).server).ports).admin | int }}
          envFrom:
            - configMapRef:
                name: {{ include "falcon.configMapName" . | quote }}
            - secretRef:
                name: {{ include "falcon.secretName" . | quote }}
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
