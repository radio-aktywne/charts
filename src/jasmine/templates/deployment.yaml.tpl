apiVersion: apps/v1
kind: Deployment
metadata:
  {{- include "jasmine.deploymentMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "jasmine.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "jasmine.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "jasmine.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/jasmine:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "jasmine.server.port is required" ((.Values.jasmine).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "jasmine.configMapName" . | quote }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- with (.Values.deployment).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
