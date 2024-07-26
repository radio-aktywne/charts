apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "emifuse.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emifuse.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emifuse.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emifuse.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/apps/emifuse:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: srt
              protocol: UDP
              containerPort: {{ required "app.server.srt.port is required" (((.Values.app).server).srt).port | int }}
            - name: http
              protocol: TCP
              containerPort: {{ required "app.server.http.port is required" (((.Values.app).server).http).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emifuse.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emifuse.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "emifuse.volumeName" . | quote }}
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
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "emifuse.volumeMetadata" . | nindent 8 }}
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
