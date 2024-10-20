{{/*
Name of the service

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "quokka.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "quokka.containerName" -}}
{{ include "quokka.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "quokka.secretName" -}}
{{ include "quokka.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "quokka.configMapName" -}}
{{ include "quokka.name" . }}
{{- end }}

{{/*
Name of the Deployment
*/}}
{{- define "quokka.deploymentName" -}}
{{ include "quokka.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "quokka.serviceName" -}}
{{ include "quokka.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "quokka.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "quokka.selector" -}}
app.kubernetes.io/name: {{ include "quokka.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "quokka.metadata" -}}
labels:
  helm.sh/chart: {{ include "quokka.chartLabel" . | quote }}
  {{- include "quokka.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "quokka.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "quokka.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "quokka.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "quokka.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "quokka.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "quokka.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "quokka.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "quokka.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Deployment
*/}}
{{- define "quokka.deploymentMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $deploymentMetadata := (.Values.deployment).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "quokka.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $deploymentMetadata $chartMetadata -}}
name: {{ include "quokka.deploymentName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "quokka.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "quokka.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "quokka.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
