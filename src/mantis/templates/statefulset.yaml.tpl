apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "mantis.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "mantis.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "mantis.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "mantis.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/mantis:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "mantis.server.port is required" ((.Values.mantis).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "mantis.configMapName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "mantis.volumeName" . | quote }}
              mountPath: /app/data/
          {{- end }}
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
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "mantis.volumeMetadata" . | nindent 8 }}
      spec:
        {{- if (.Values.volume).class }}
        storageClassName: {{ (.Values.volume).class | quote }}
        {{- end }}
        accessModes:
          {{- required "volume.access is required" (.Values.volume).access | toStrings | toYaml | nindent 10 }}
        resources:
          requests:
            storage: {{ required "volume.size is required" (.Values.volume).size | quote }}
        {{- with (.Values.volume).spec }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
  {{- end }}
  {{- with (.Values.statefulSet).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
