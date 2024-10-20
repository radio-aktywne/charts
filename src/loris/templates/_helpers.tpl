{{/*
Name of the service

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "loris.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "loris.containerName" -}}
{{ include "loris.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "loris.configMapName" -}}
{{ include "loris.name" . }}
{{- end }}

{{/*
Name of the Deployment
*/}}
{{- define "loris.deploymentName" -}}
{{ include "loris.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "loris.serviceName" -}}
{{ include "loris.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "loris.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "loris.selector" -}}
app.kubernetes.io/name: {{ include "loris.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "loris.metadata" -}}
labels:
  helm.sh/chart: {{ include "loris.chartLabel" . | quote }}
  {{- include "loris.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "loris.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "loris.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "loris.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "loris.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "loris.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Deployment
*/}}
{{- define "loris.deploymentMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $deploymentMetadata := (.Values.deployment).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "loris.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $deploymentMetadata $chartMetadata -}}
name: {{ include "loris.deploymentName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "loris.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "loris.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "loris.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
