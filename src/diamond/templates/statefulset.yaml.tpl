apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "diamond.statefulSetMetadata" . | nindent 2 }}
spec:
  selector:
    matchLabels:
      {{- include "diamond.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "diamond.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "diamond.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/diamond:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: sql
              protocol: TCP
              containerPort: {{ required "diamond.server.port is required" ((.Values.diamond).server).port | int }}
          envFrom:
            - configMapRef:
                name: {{ include "diamond.configMapName" . | quote }}
            - secretRef:
                name: {{ include "diamond.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "diamond.volumeName" . | quote }}
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
        {{- include "diamond.volumeMetadata" . | nindent 8 }}
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
