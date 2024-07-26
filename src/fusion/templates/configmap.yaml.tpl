apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "fusion.configMapMetadata" . | nindent 2 }}
data:
  FUSION__SERVER__SRT__PORT: {{ required "app.server.srt.port is required" (((.Values.app).server).srt).port | int | quote }}
  FUSION__SERVER__HTTP__PORT: {{ required "app.server.http.port is required" (((.Values.app).server).http).port | int | quote }}
  FUSION__EMICAST__ICY__HOST: {{ required "app.emicast.icy.host is required" (((.Values.app).emicast).icy).host | quote }}
  FUSION__EMICAST__ICY__PORT: {{ required "app.emicast.icy.port is required" (((.Values.app).emicast).icy).port | int | quote }}
  FUSION__EMICAST__ICY__MOUNT: {{ required "app.emicast.icy.mount is required" (((.Values.app).emicast).icy).mount | quote }}
  FUSION__EMITUNES__HTTP__SCHEME: {{ required "app.emitunes.http.scheme is required" (((.Values.app).emitunes).http).scheme | quote }}
  FUSION__EMITUNES__HTTP__HOST: {{ required "app.emitunes.http.host is required" (((.Values.app).emitunes).http).host | quote }}
  FUSION__EMITUNES__HTTP__PORT: {{ required "app.emitunes.http.port is required" (((.Values.app).emitunes).http).port | int | quote }}
  {{- if (((.Values.app).emitunes).http).path }}
  FUSION__EMITUNES__HTTP__PATH: {{ .Values.app.emitunes.http.path | quote }}
  {{- end }}
