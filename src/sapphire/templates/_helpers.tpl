{{/*
Name of the database

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "sapphire.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "sapphire.containerName" -}}
{{ include "sapphire.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "sapphire.secretName" -}}
{{ include "sapphire.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "sapphire.configMapName" -}}
{{ include "sapphire.name" . }}
{{- end }}

{{/*
Name of the Volume
*/}}
{{- define "sapphire.volumeName" -}}
{{ include "sapphire.name" . }}
{{- end }}

{{/*
Name of the StatefulSet
*/}}
{{- define "sapphire.statefulSetName" -}}
{{ include "sapphire.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "sapphire.serviceName" -}}
{{ include "sapphire.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "sapphire.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "sapphire.selector" -}}
app.kubernetes.io/name: {{ include "sapphire.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "sapphire.metadata" -}}
labels:
  helm.sh/chart: {{ include "sapphire.chartLabel" . | quote }}
  {{- include "sapphire.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Subset of common metadata that should be stable
*/}}
{{- define "sapphire.stableMetadata" -}}
labels:
  {{- include "sapphire.selector" . | nindent 2 }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "sapphire.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "sapphire.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "sapphire.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "sapphire.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "sapphire.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "sapphire.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Volume
*/}}
{{- define "sapphire.volumeMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $volumeMetadata := (.Values.volume).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "sapphire.stableMetadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $volumeMetadata $chartMetadata -}}
name: {{ include "sapphire.volumeName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "sapphire.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "sapphire.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the StatefulSet
*/}}
{{- define "sapphire.statefulSetMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $statefulSetMetadata := (.Values.statefulSet).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "sapphire.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $statefulSetMetadata $chartMetadata -}}
name: {{ include "sapphire.statefulSetName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "sapphire.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "sapphire.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "sapphire.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
