apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "dingo.configMapMetadata" . | nindent 2 }}
data:
  DINGO__SERVER__SRT__PORT: {{ required "dingo.server.srt.port is required" (((.Values.dingo).server).srt).port | int | quote }}
  DINGO__SERVER__HTTP__PORT: {{ required "dingo.server.http.port is required" (((.Values.dingo).server).http).port | int | quote }}
  DINGO__PELICAN__HTTP__SCHEME: {{ required "dingo.pelican.http.scheme is required" (((.Values.dingo).pelican).http).scheme | quote }}
  DINGO__PELICAN__HTTP__HOST: {{ required "dingo.pelican.http.host is required" (((.Values.dingo).pelican).http).host | quote }}
  DINGO__PELICAN__HTTP__PORT: {{ required "dingo.pelican.http.port is required" (((.Values.dingo).pelican).http).port | int | quote }}
  {{- if (((.Values.dingo).pelican).http).path }}
  DINGO__PELICAN__HTTP__PATH: {{ .Values.dingo.pelican.http.path | quote }}
  {{- end }}
  DINGO__QUOKKA__ICY__HOST: {{ required "dingo.quokka.icy.host is required" (((.Values.dingo).quokka).icy).host | quote }}
  DINGO__QUOKKA__ICY__PORT: {{ required "dingo.quokka.icy.port is required" (((.Values.dingo).quokka).icy).port | int | quote }}
  DINGO__QUOKKA__ICY__MOUNT: {{ required "dingo.quokka.icy.mount is required" (((.Values.dingo).quokka).icy).mount | quote }}
