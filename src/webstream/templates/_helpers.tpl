{{/*
Name of the app

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "webstream.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "webstream.containerName" -}}
{{ include "webstream.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "webstream.configMapName" -}}
{{ include "webstream.name" . }}
{{- end }}

{{/*
Name of the Deployment
*/}}
{{- define "webstream.deploymentName" -}}
{{ include "webstream.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "webstream.serviceName" -}}
{{ include "webstream.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "webstream.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "webstream.selector" -}}
app.kubernetes.io/name: {{ include "webstream.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "webstream.metadata" -}}
labels:
  helm.sh/chart: {{ include "webstream.chartLabel" . | quote }}
  {{- include "webstream.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "webstream.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "webstream.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "webstream.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "webstream.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "webstream.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Deployment
*/}}
{{- define "webstream.deploymentMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $deploymentMetadata := (.Values.deployment).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "webstream.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $deploymentMetadata $chartMetadata -}}
name: {{ include "webstream.deploymentName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "webstream.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "webstream.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "webstream.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
