apiVersion: apps/v1
kind: StatefulSet
metadata:
  {{- include "emishows-db.statefulSetMetadata" . | nindent 2 }}
spec:
  replicas: 1
  selector:
    matchLabels:
      {{- include "emishows-db.selector" . | nindent 6 }}
  template:
    metadata:
      {{- include "emishows-db.podMetadata" . | nindent 6 }}
    spec:
      containers:
        - name: {{ include "emishows-db.containerName" . | quote }}
          image: "ghcr.io/radio-aktywne/databases/emishows-db:{{ .Chart.AppVersion }}"
          ports:
            - name: sql
              protocol: TCP
              containerPort: {{ required "database.ports.sql is required" ((.Values.database).ports).sql | int }}
            - name: http
              protocol: TCP
              containerPort: {{ required "database.ports.http is required" ((.Values.database).ports).http | int }}
            - name: rpc
              protocol: TCP
              containerPort: {{ required "database.ports.rpc is required" ((.Values.database).ports).rpc | int }}
          envFrom:
            - configMapRef:
                name: {{ include "emishows-db.configMapName" . | quote }}
            - secretRef:
                name: {{ include "emishows-db.secretName" . | quote }}
          {{- if .Values.volume }}
          volumeMounts:
            - name: {{ include "emishows-db.volumeName" . | quote }}
              mountPath: /database/data/
          {{- end }}
          livenessProbe:
            httpGet:
              path: /health
              port: http
            failureThreshold: 9
          readinessProbe:
            httpGet:
              path: /health?ready=1
              port: http
            failureThreshold: 3
      {{- with (.Values.pod).spec }}
      {{- toYaml . | nindent 6 }}
      {{- end }}
  {{- if .Values.volume }}
  volumeClaimTemplates:
    - metadata:
        {{- include "emishows-db.volumeMetadata" . | nindent 8 }}
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
