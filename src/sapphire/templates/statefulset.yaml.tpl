apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "sapphire.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "sapphire.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "sapphire.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "sapphire.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/sapphire:{{ .Chart.AppVersion }}"
          imagePullPolicy: Always
          ports:
            - name: sql
              protocol: TCP
              containerPort: {{ required "sapphire.server.ports.sql is required" (((.Values.sapphire).server).ports).sql | int }}
            - name: http
              protocol: TCP
              containerPort: {{ required "sapphire.server.ports.http is required" (((.Values.sapphire).server).ports).http | int }}
            - name: rpc
              protocol: TCP
              containerPort: {{ required "sapphire.server.ports.rpc is required" (((.Values.sapphire).server).ports).rpc | int }}
          envFrom:
            - configMapRef:
                name: {{ include "sapphire.configMapName" . | quote }}
            - secretRef:
                name: {{ include "sapphire.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "sapphire.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /health
              port: http
            failureThreshold: 6
          readinessProbe:
            httpGet:
              path: /health?ready=1
              port: http
            failureThreshold: 6
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "sapphire.volumeMetadata" . | nindent 8 }}
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
