{{/*
Name of the app

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "streamcast.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "streamcast.containerName" -}}
{{ include "streamcast.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "streamcast.secretName" -}}
{{ include "streamcast.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "streamcast.configMapName" -}}
{{ include "streamcast.name" . }}
{{- end }}

{{/*
Name of the Deployment
*/}}
{{- define "streamcast.deploymentName" -}}
{{ include "streamcast.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "streamcast.serviceName" -}}
{{ include "streamcast.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "streamcast.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "streamcast.selector" -}}
app.kubernetes.io/name: {{ include "streamcast.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "streamcast.metadata" -}}
labels:
  helm.sh/chart: {{ include "streamcast.chartLabel" . | quote }}
  {{- include "streamcast.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "streamcast.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "streamcast.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "streamcast.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "streamcast.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "streamcast.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "streamcast.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "streamcast.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "streamcast.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Deployment
*/}}
{{- define "streamcast.deploymentMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $deploymentMetadata := (.Values.deployment).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "streamcast.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $deploymentMetadata $chartMetadata -}}
name: {{ include "streamcast.deploymentName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "streamcast.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "streamcast.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "streamcast.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
