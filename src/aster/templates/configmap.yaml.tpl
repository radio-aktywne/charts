apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "aster.configMapMetadata" . | nindent 2 }}
data:
  ASTER__APIS__DINGO__HOST: {{ required "aster.apis.dingo.host is required" (((.Values.aster).apis).dingo).host | quote }}
  ASTER__APIS__DINGO__PATH: {{ (((.Values.aster).apis).dingo).path | default "" | quote }}
  ASTER__APIS__DINGO__PORT: {{ (((.Values.aster).apis).dingo).port | int | default "" | quote }}
  ASTER__APIS__DINGO__SCHEME: {{ required "aster.apis.dingo.scheme is required" (((.Values.aster).apis).dingo).scheme | quote }}
  ASTER__APIS__ICANHAZDADJOKE__HOST: {{ required "aster.apis.icanhazdadjoke.host is required" (((.Values.aster).apis).icanhazdadjoke).host | quote }}
  ASTER__APIS__ICANHAZDADJOKE__PATH: {{ (((.Values.aster).apis).icanhazdadjoke).path | default "" | quote }}
  ASTER__APIS__ICANHAZDADJOKE__PORT: {{ (((.Values.aster).apis).icanhazdadjoke).port | int | default "" | quote }}
  ASTER__APIS__ICANHAZDADJOKE__SCHEME: {{ required "aster.apis.icanhazdadjoke.scheme is required" (((.Values.aster).apis).icanhazdadjoke).scheme | quote }}
  ASTER__APIS__PELICAN__HOST: {{ required "aster.apis.pelican.host is required" (((.Values.aster).apis).pelican).host | quote }}
  ASTER__APIS__PELICAN__PATH: {{ (((.Values.aster).apis).pelican).path | default "" | quote }}
  ASTER__APIS__PELICAN__PORT: {{ (((.Values.aster).apis).pelican).port | int | default "" | quote }}
  ASTER__APIS__PELICAN__SCHEME: {{ required "aster.apis.pelican.scheme is required" (((.Values.aster).apis).pelican).scheme | quote }}
  ASTER__DEBUG: {{ required "aster.debug is required" (.Values.aster).debug | quote }}
  ASTER__SERVER__PORT: {{ required "aster.server.port is required" ((.Values.aster).server).port | int | quote }}
