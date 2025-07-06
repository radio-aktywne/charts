apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "graphite.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "graphite.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "graphite.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "graphite.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/graphite:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: sql
              protocol: TCP
              containerPort: {{ required "graphite.server.port is required" ((.Values.graphite).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "graphite.configMapName" . | quote }}
            - secretRef:
                name: {{ include "graphite.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "graphite.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            tcpSocket:
              port: sql
            failureThreshold: 6
          readinessProbe:
            tcpSocket:
              port: sql
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
        {{- include "graphite.volumeMetadata" . | nindent 8 }}
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
