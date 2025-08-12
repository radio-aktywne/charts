apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "dingo.statefulSetMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "dingo.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "dingo.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "dingo.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/services/dingo:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: srt
              protocol: UDP
              containerPort: {{ required "dingo.server.srt.port is required" (((.Values.dingo).server).srt).port | int }}
            - name: http
              protocol: TCP
              containerPort: {{ required "dingo.server.http.port is required" (((.Values.dingo).server).http).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "dingo.configMapName" . | quote }}
            - secretRef:
                name: {{ include "dingo.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "dingo.volumeName" . | quote }}
              mountPath: /service/data/
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
        {{- include "dingo.volumeMetadata" . | nindent 8 }}
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
