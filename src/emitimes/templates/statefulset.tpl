apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "emitimes.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emitimes.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emitimes.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emitimes.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/emitimes:{{ .Chart.AppVersion }}"
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "database.port is required" (.Values.database).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emitimes.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emitimes.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "emitimes.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /
              port: http
            failureThreshold: 9
          readinessProbe:
            httpGet:
              path: /
              port: http
            failureThreshold: 3
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "emitimes.volumeMetadata" . | nindent 8 }}
      spec:
        accessModes:
          {{- required "volume.access is required" (.Values.volume).access | toStrings | toYaml | nindent 10 }}
        {{- if (.Values.volume).class }}
        storageClassName: {{ (.Values.volume).class | quote }}
        {{- end }}
        {{- if (.Values.volume).size }}
        resources:
          requests:
            storage: {{ (.Values.volume).size | quote }}
        {{- end }}
        {{- with (.Values.volume).spec }}
        {{- toYaml . | nindent 8 }}
        {{- end }}
  {{- end }}
  {{- with (.Values.statefulSet).spec }}
  {{- toYaml . | nindent 2 }}
  {{- end }}
