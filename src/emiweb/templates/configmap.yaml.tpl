apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "emiweb.configMapMetadata" . | nindent 2 }}
data:
  EMIWEB__SERVER__PORT: {{ required "app.port is required" (.Values.app).port | int | quote }}
  EMIWEB__EVENTS__WINDOW: {{ required "app.events.window is required" ((.Values.app).events).window | quote }}
  EMIWEB__EMISHOWS__HOST: {{ required "app.emishows.host is required" ((.Values.app).emishows).host | quote }}
  EMIWEB__EMISHOWS__PORT: {{ required "app.emishows.port is required" ((.Values.app).emishows).port | int | quote }}
  EMIWEB__EMISTREAM__HTTP__HOST: {{ required "app.emistream.http.host is required" (((.Values.app).emistream).http).host | quote }}
  EMIWEB__EMISTREAM__HTTP__PORT: {{ required "app.emistream.http.port is required" (((.Values.app).emistream).http).port | int | quote }}
  EMIWEB__EMISTREAM__SRT__HOST: {{ required "app.emistream.srt.host is required" (((.Values.app).emistream).srt).host | quote }}
  EMIWEB__EMISTREAM__SRT__PORT: {{ required "app.emistream.srt.port is required" (((.Values.app).emistream).srt).port | int | quote }}
  EMIWEB__EMIPASS__HTTP__HOST: {{ required "app.emipass.http.host is required" (((.Values.app).emipass).http).host | quote }}
  EMIWEB__EMIPASS__HTTP__PORT: {{ required "app.emipass.http.port is required" (((.Values.app).emipass).http).port | int | quote }}
  EMIWEB__EMIPASS__WHIP__HOST: {{ required "app.emipass.whip.host is required" (((.Values.app).emipass).whip).host | quote }}
  EMIWEB__EMIPASS__WHIP__PORT: {{ required "app.emipass.whip.port is required" (((.Values.app).emipass).whip).port | int | quote }}
