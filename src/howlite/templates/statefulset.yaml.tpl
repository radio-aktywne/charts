apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "howlite.statefulSetMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "howlite.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "howlite.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "howlite.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/howlite:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: http
              protocol: TCP
              containerPort: {{ required "howlite.server.port is required" ((.Values.howlite).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "howlite.configMapName" . | quote }}
            - secretRef:
                name: {{ include "howlite.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "howlite.volumeName" . | quote }}
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
          {{- with (.Values.container).spec }}
          {{- toYaml . | nindent 10 }}
          {{- end }}
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "howlite.volumeMetadata" . | nindent 8 }}
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
