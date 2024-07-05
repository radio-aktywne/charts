apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "webstream.configMapMetadata" . | nindent 2 }}
data:
  WEBSTREAM__SERVER__PORT: {{ required "app.server.port is required" ((.Values.app).server).port | int | quote }}
  WEBSTREAM__EVENTS__WINDOW: {{ required "app.events.window is required" ((.Values.app).events).window | quote }}
  WEBSTREAM__EMISHOWS__HTTP__SCHEME: {{ required "app.emishows.http.scheme is required" (((.Values.app).emishows).http).scheme | quote }}
  WEBSTREAM__EMISHOWS__HTTP__HOST: {{ required "app.emishows.http.host is required" (((.Values.app).emishows).http).host | quote }}
  WEBSTREAM__EMISHOWS__HTTP__PORT: {{ required "app.emishows.http.port is required" (((.Values.app).emishows).http).port | int | quote }}
  {{- if (((.Values.app).emishows).http).path }}
  WEBSTREAM__EMISHOWS__HTTP__PATH: {{ .Values.app.emishows.http.path | quote }}
  {{- end }}
  WEBSTREAM__EMISTREAM__HTTP__SCHEME: {{ required "app.emistream.http.scheme is required" (((.Values.app).emistream).http).scheme | quote }}
  WEBSTREAM__EMISTREAM__HTTP__HOST: {{ required "app.emistream.http.host is required" (((.Values.app).emistream).http).host | quote }}
  WEBSTREAM__EMISTREAM__HTTP__PORT: {{ required "app.emistream.http.port is required" (((.Values.app).emistream).http).port | int | quote }}
  {{- if (((.Values.app).emistream).http).path }}
  WEBSTREAM__EMISTREAM__HTTP__PATH: {{ .Values.app.emistream.http.path | quote }}
  {{- end }}
  WEBSTREAM__EMISTREAM__SRT__HOST: {{ required "app.emistream.srt.host is required" (((.Values.app).emistream).srt).host | quote }}
  WEBSTREAM__EMISTREAM__SRT__PORT: {{ required "app.emistream.srt.port is required" (((.Values.app).emistream).srt).port | int | quote }}
  WEBSTREAM__EMIPASS__HTTP__SCHEME: {{ required "app.emipass.http.scheme is required" (((.Values.app).emipass).http).scheme | quote }}
  WEBSTREAM__EMIPASS__HTTP__HOST: {{ required "app.emipass.http.host is required" (((.Values.app).emipass).http).host | quote }}
  WEBSTREAM__EMIPASS__HTTP__PORT: {{ required "app.emipass.http.port is required" (((.Values.app).emipass).http).port | int | quote }}
  {{- if (((.Values.app).emipass).http).path }}
  WEBSTREAM__EMIPASS__HTTP__PATH: {{ .Values.app.emipass.http.path | quote }}
  {{- end }}
  WEBSTREAM__EMIPASS__WHIP__SCHEME: {{ required "app.emipass.whip.scheme is required" (((.Values.app).emipass).whip).scheme | quote }}
  WEBSTREAM__EMIPASS__WHIP__HOST: {{ required "app.emipass.whip.host is required" (((.Values.app).emipass).whip).host | quote }}
  WEBSTREAM__EMIPASS__WHIP__PORT: {{ required "app.emipass.whip.port is required" (((.Values.app).emipass).whip).port | int | quote }}
  {{- if (((.Values.app).emipass).whip).path }}
  WEBSTREAM__EMIPASS__WHIP__PATH: {{ .Values.app.emipass.whip.path | quote }}
  {{- end }}
