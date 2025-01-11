{{/*
Name of the service

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "scorpion.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "scorpion.containerName" -}}
{{ include "scorpion.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "scorpion.secretName" -}}
{{ include "scorpion.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "scorpion.configMapName" -}}
{{ include "scorpion.name" . }}
{{- end }}

{{/*
Name of the Deployment
*/}}
{{- define "scorpion.deploymentName" -}}
{{ include "scorpion.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "scorpion.serviceName" -}}
{{ include "scorpion.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "scorpion.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "scorpion.selector" -}}
app.kubernetes.io/name: {{ include "scorpion.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "scorpion.metadata" -}}
labels:
  helm.sh/chart: {{ include "scorpion.chartLabel" . | quote }}
  {{- include "scorpion.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Subset of common metadata that should be stable
*/}}
{{- define "scorpion.stableMetadata" -}}
labels:
  {{- include "scorpion.selector" . | nindent 2 }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "scorpion.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "scorpion.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "scorpion.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "scorpion.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "scorpion.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "scorpion.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "scorpion.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "scorpion.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Deployment
*/}}
{{- define "scorpion.deploymentMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $deploymentMetadata := (.Values.deployment).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "scorpion.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $deploymentMetadata $chartMetadata -}}
name: {{ include "scorpion.deploymentName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "scorpion.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "scorpion.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "scorpion.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
