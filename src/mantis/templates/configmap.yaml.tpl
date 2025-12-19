apiVersion: v1
kind: ConfigMap
metadata:
  {{- include "mantis.configMapMetadata" . | nindent 2 }}
data:
  MANTIS__BEAVER__HTTP__HOST: {{ required "mantis.beaver.http.host is required" (((.Values.mantis).beaver).http).host | quote }}
  MANTIS__BEAVER__HTTP__PATH: {{ (((.Values.mantis).beaver).http).path | default "" | quote }}
  MANTIS__BEAVER__HTTP__PORT: {{ (((.Values.mantis).beaver).http).port | int | default "" | quote }}
  MANTIS__BEAVER__HTTP__SCHEME: {{ required "mantis.beaver.http.scheme is required" (((.Values.mantis).beaver).http).scheme | quote }}
  MANTIS__CLEANER__INTERVAL: {{ required "mantis.cleaner.interval is required" ((.Values.mantis).cleaner).interval | quote }}
  MANTIS__CLEANER__REFERENCE: {{ required "mantis.cleaner.reference is required" ((.Values.mantis).cleaner).reference | quote }}
  MANTIS__DEBUG: {{ required "mantis.debug is required" (.Values.mantis).debug | quote }}
  MANTIS__GECKO__HTTP__HOST: {{ required "mantis.gecko.http.host is required" (((.Values.mantis).gecko).http).host | quote }}
  MANTIS__GECKO__HTTP__PATH: {{ (((.Values.mantis).gecko).http).path | default "" | quote }}
  MANTIS__GECKO__HTTP__PORT: {{ (((.Values.mantis).gecko).http).port | int | default "" | quote }}
  MANTIS__GECKO__HTTP__SCHEME: {{ required "mantis.gecko.http.scheme is required" (((.Values.mantis).gecko).http).scheme | quote }}
  MANTIS__NUMBAT__HTTP__HOST: {{ required "mantis.numbat.http.host is required" (((.Values.mantis).numbat).http).host | quote }}
  MANTIS__NUMBAT__HTTP__PATH: {{ (((.Values.mantis).numbat).http).path | default "" | quote }}
  MANTIS__NUMBAT__HTTP__PORT: {{ (((.Values.mantis).numbat).http).port | int | default "" | quote }}
  MANTIS__NUMBAT__HTTP__SCHEME: {{ required "mantis.numbat.http.scheme is required" (((.Values.mantis).numbat).http).scheme | quote }}
  MANTIS__OCTOPUS__HTTP__HOST: {{ required "mantis.octopus.http.host is required" (((.Values.mantis).octopus).http).host | quote }}
  MANTIS__OCTOPUS__HTTP__PATH: {{ (((.Values.mantis).octopus).http).path | default "" | quote }}
  MANTIS__OCTOPUS__HTTP__PORT: {{ (((.Values.mantis).octopus).http).port | int | default "" | quote }}
  MANTIS__OCTOPUS__HTTP__SCHEME: {{ required "mantis.octopus.http.scheme is required" (((.Values.mantis).octopus).http).scheme | quote }}
  MANTIS__OCTOPUS__SRT__HOST: {{ required "mantis.octopus.srt.host is required" (((.Values.mantis).octopus).srt).host | quote }}
  MANTIS__OCTOPUS__SRT__PORT: {{ required "mantis.octopus.srt.port is required" (((.Values.mantis).octopus).srt).port | int | quote }}
  MANTIS__OPERATIONS__STREAM__TIMEOUT: {{ required "mantis.operations.stream.timeout is required" (((.Values.mantis).operations).stream).timeout | quote }}
  MANTIS__OPERATIONS__STREAM__WINDOW: {{ required "mantis.operations.stream.window is required" (((.Values.mantis).operations).stream).window | quote }}
  MANTIS__SERVER__PORT: {{ required "mantis.server.port is required" ((.Values.mantis).server).port | int | quote }}
  MANTIS__SYNCHRONIZER__INTERVAL: {{ required "mantis.synchronizer.interval is required" ((.Values.mantis).synchronizer).interval | quote }}
  MANTIS__SYNCHRONIZER__REFERENCE: {{ required "mantis.synchronizer.reference is required" ((.Values.mantis).synchronizer).reference | quote }}
  MANTIS__SYNCHRONIZER__SYNCHRONIZERS__STREAM__WINDOW: {{ required "mantis.synchronizer.synchronizers.stream.window is required" ((((.Values.mantis).synchronizer).synchronizers).stream).window | quote }}
