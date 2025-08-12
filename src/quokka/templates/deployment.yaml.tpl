apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "quokka.deploymentMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "quokka.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "quokka.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "quokka.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/quokka:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "quokka.server.port is required" ((.Values.quokka).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "quokka.configMapName" . | quote }}
            - secretRef:
                name: {{ include "quokka.secretName" . | quote }}
          livenessProbe:
            httpGet:
              path: /admin/publicstats.json
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /admin/publicstats.json
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
