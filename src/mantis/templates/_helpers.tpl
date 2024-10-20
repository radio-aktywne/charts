{{/*
Name of the service

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "mantis.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "mantis.containerName" -}}
{{ include "mantis.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "mantis.configMapName" -}}
{{ include "mantis.name" . }}
{{- end }}

{{/*
Name of the Volume
*/}}
{{- define "mantis.volumeName" -}}
{{ include "mantis.name" . }}
{{- end }}

{{/*
Name of the StatefulSet
*/}}
{{- define "mantis.statefulSetName" -}}
{{ include "mantis.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "mantis.serviceName" -}}
{{ include "mantis.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "mantis.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "mantis.selector" -}}
app.kubernetes.io/name: {{ include "mantis.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "mantis.metadata" -}}
labels:
  helm.sh/chart: {{ include "mantis.chartLabel" . | quote }}
  {{- include "mantis.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "mantis.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "mantis.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "mantis.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Volume
*/}}
{{- define "mantis.volumeMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $volumeMetadata := (.Values.volume).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "mantis.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $volumeMetadata $chartMetadata -}}
name: {{ include "mantis.volumeName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "mantis.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "mantis.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the StatefulSet
*/}}
{{- define "mantis.statefulSetMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $statefulSetMetadata := (.Values.statefulSet).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "mantis.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $statefulSetMetadata $chartMetadata -}}
name: {{ include "mantis.statefulSetName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "mantis.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "mantis.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "mantis.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
