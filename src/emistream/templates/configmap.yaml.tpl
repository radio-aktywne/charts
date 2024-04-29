apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emistream.configMapMetadata" . | nindent 2 }}
data:
  EMISTREAM__SERVER__PORTS__HTTP: {{ required "app.server.ports.http is required" (((.Values.app).server).ports).http | int | quote }}
  EMISTREAM__SERVER__PORTS__SRT: {{ required "app.server.ports.srt is required" (((.Values.app).server).ports).srt | int | quote }}
  EMISTREAM__STREAM__TIMEOUT: {{ required "app.stream.timeout is required" ((.Values.app).stream).timeout | quote }}
  EMISTREAM__STREAM__WINDOW: {{ required "app.stream.window is required" ((.Values.app).stream).window | quote }}
  EMISTREAM__FUSION__SRT__HOST: {{ required "app.fusion.srt.host is required" (((.Values.app).fusion).srt).host | quote }}
  EMISTREAM__FUSION__SRT__PORT: {{ required "app.fusion.srt.port is required" (((.Values.app).fusion).srt).port | int | quote }}
  EMISTREAM__EMIRECORDER__HTTP__SCHEME: {{ required "app.emirecorder.http.scheme is required" (((.Values.app).emirecorder).http).scheme | quote }}
  EMISTREAM__EMIRECORDER__HTTP__HOST: {{ required "app.emirecorder.http.host is required" (((.Values.app).emirecorder).http).host | quote }}
  EMISTREAM__EMIRECORDER__HTTP__PORT: {{ required "app.emirecorder.http.port is required" (((.Values.app).emirecorder).http).port | int | quote }}
  {{- if (((.Values.app).emirecorder).http).path }}
  EMISTREAM__EMIRECORDER__HTTP__PATH: {{ .Values.app.emirecorder.http.path | quote }}
  {{- end }}
  EMISTREAM__EMIRECORDER__SRT__HOST: {{ required "app.emirecorder.srt.host is required" (((.Values.app).emirecorder).srt).host | quote }}
  EMISTREAM__EMIRECORDER__SRT__PORT: {{ required "app.emirecorder.srt.port is required" (((.Values.app).emirecorder).srt).port | int | quote }}
  EMISTREAM__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  EMISTREAM__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  EMISTREAM__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  EMISTREAM__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
