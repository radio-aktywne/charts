apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "datatimes.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "datatimes.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "datatimes.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "datatimes.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/datatimes:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "database.server.port is required" ((.Values.database).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "datatimes.configMapName" . | quote }}
            - secretRef:
                name: {{ include "datatimes.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "datatimes.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /
              port: http
            failureThreshold: 6
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "datatimes.volumeMetadata" . | nindent 8 }}
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
