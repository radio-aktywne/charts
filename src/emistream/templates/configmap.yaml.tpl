apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emistream.configMapMetadata" . | nindent 2 }}
data:
  EMISTREAM__SERVER__PORTS__HTTP: {{ required "app.server.ports.http is required" (((.Values.app).server).ports).http | int | quote }}
  EMISTREAM__SERVER__PORTS__SRT: {{ required "app.server.ports.srt is required" (((.Values.app).server).ports).srt | int | quote }}
  EMISTREAM__STREAM__TIMEOUT: {{ required "app.stream.timeout is required" ((.Values.app).stream).timeout | quote }}
  EMISTREAM__STREAM__WINDOW: {{ required "app.stream.window is required" ((.Values.app).stream).window | quote }}
  EMISTREAM__EMIFUSE__SRT__HOST: {{ required "app.emifuse.srt.host is required" (((.Values.app).emifuse).srt).host | quote }}
  EMISTREAM__EMIFUSE__SRT__PORT: {{ required "app.emifuse.srt.port is required" (((.Values.app).emifuse).srt).port | int | quote }}
  EMISTREAM__EMIRECORDS__HTTP__SCHEME: {{ required "app.emirecords.http.scheme is required" (((.Values.app).emirecords).http).scheme | quote }}
  EMISTREAM__EMIRECORDS__HTTP__HOST: {{ required "app.emirecords.http.host is required" (((.Values.app).emirecords).http).host | quote }}
  EMISTREAM__EMIRECORDS__HTTP__PORT: {{ required "app.emirecords.http.port is required" (((.Values.app).emirecords).http).port | int | quote }}
  {{- if (((.Values.app).emirecords).http).path }}
  EMISTREAM__EMIRECORDS__HTTP__PATH: {{ .Values.app.emirecords.http.path | quote }}
  {{- end }}
  EMISTREAM__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMISTREAM__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMISTREAM__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMISTREAM__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
