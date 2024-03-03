{{/*
Name of the database

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "emitimes.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "emitimes.containerName" -}}
{{ include "emitimes.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "emitimes.secretName" -}}
{{ include "emitimes.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "emitimes.configMapName" -}}
{{ include "emitimes.name" . }}
{{- end }}

{{/*
Name of the Volume
*/}}
{{- define "emitimes.volumeName" -}}
{{ include "emitimes.name" . }}
{{- end }}

{{/*
Name of the StatefulSet
*/}}
{{- define "emitimes.statefulSetName" -}}
{{ include "emitimes.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "emitimes.serviceName" -}}
{{ include "emitimes.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "emitimes.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "emitimes.selector" -}}
app.kubernetes.io/name: {{ include "emitimes.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "emitimes.metadata" -}}
labels:
  helm.sh/chart: {{ include "emitimes.chartLabel" . | quote }}
  {{- include "emitimes.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "emitimes.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "emitimes.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "emitimes.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "emitimes.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "emitimes.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "emitimes.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Volume
*/}}
{{- define "emitimes.volumeMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $volumeMetadata := (.Values.volume).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "emitimes.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $volumeMetadata $chartMetadata -}}
name: {{ include "emitimes.volumeName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "emitimes.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "emitimes.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the StatefulSet
*/}}
{{- define "emitimes.statefulSetMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $statefulSetMetadata := (.Values.statefulSet).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "emitimes.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $statefulSetMetadata $chartMetadata -}}
name: {{ include "emitimes.statefulSetName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "emitimes.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "emitimes.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "emitimes.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
