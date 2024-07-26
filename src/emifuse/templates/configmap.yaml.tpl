apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emifuse.configMapMetadata" . | nindent 2 }}
data:
  EMIFUSE__SERVER__SRT__PORT: {{ required "app.server.srt.port is required" (((.Values.app).server).srt).port | int | quote }}
  EMIFUSE__SERVER__HTTP__PORT: {{ required "app.server.http.port is required" (((.Values.app).server).http).port | int | quote }}
  EMIFUSE__EMICAST__ICY__HOST: {{ required "app.emicast.icy.host is required" (((.Values.app).emicast).icy).host | quote }}
  EMIFUSE__EMICAST__ICY__PORT: {{ required "app.emicast.icy.port is required" (((.Values.app).emicast).icy).port | int | quote }}
  EMIFUSE__EMICAST__ICY__MOUNT: {{ required "app.emicast.icy.mount is required" (((.Values.app).emicast).icy).mount | quote }}
  EMIFUSE__EMITUNES__HTTP__SCHEME: {{ required "app.emitunes.http.scheme is required" (((.Values.app).emitunes).http).scheme | quote }}
  EMIFUSE__EMITUNES__HTTP__HOST: {{ required "app.emitunes.http.host is required" (((.Values.app).emitunes).http).host | quote }}
  EMIFUSE__EMITUNES__HTTP__PORT: {{ required "app.emitunes.http.port is required" (((.Values.app).emitunes).http).port | int | quote }}
  {{- if (((.Values.app).emitunes).http).path }}
  EMIFUSE__EMITUNES__HTTP__PATH: {{ .Values.app.emitunes.http.path | quote }}
  {{- end }}
