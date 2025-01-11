apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "magnolia.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "magnolia.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "magnolia.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "magnolia.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/magnolia:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "magnolia.server.port is required" ((.Values.magnolia).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "magnolia.configMapName" . | quote }}
            - secretRef:
                name: {{ include "magnolia.secretName" . | quote }}
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
