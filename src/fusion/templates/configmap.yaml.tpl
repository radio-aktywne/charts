apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "fusion.configMapMetadata" . | nindent 2 }}
data:
  FUSION__SERVER__SRT__PORT: {{ required "app.server.srt.port is required" (((.Values.app).server).srt).port | int | quote }}
  FUSION__SERVER__HTTP__PORT: {{ required "app.server.http.port is required" (((.Values.app).server).http).port | int | quote }}
  FUSION__STREAMCAST__ICY__HOST: {{ required "app.streamcast.icy.host is required" (((.Values.app).streamcast).icy).host | quote }}
  FUSION__STREAMCAST__ICY__PORT: {{ required "app.streamcast.icy.port is required" (((.Values.app).streamcast).icy).port | int | quote }}
  FUSION__STREAMCAST__ICY__MOUNT: {{ required "app.streamcast.icy.mount is required" (((.Values.app).streamcast).icy).mount | quote }}
  FUSION__EMITUNES__HTTP__SCHEME: {{ required "app.emitunes.http.scheme is required" (((.Values.app).emitunes).http).scheme | quote }}
  FUSION__EMITUNES__HTTP__HOST: {{ required "app.emitunes.http.host is required" (((.Values.app).emitunes).http).host | quote }}
  FUSION__EMITUNES__HTTP__PORT: {{ required "app.emitunes.http.port is required" (((.Values.app).emitunes).http).port | int | quote }}
  {{- if (((.Values.app).emitunes).http).path }}
  FUSION__EMITUNES__HTTP__PATH: {{ .Values.app.emitunes.http.path | quote }}
  {{- end }}
