{{/*
Name of the database

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "amber.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "amber.containerName" -}}
{{ include "amber.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "amber.secretName" -}}
{{ include "amber.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "amber.configMapName" -}}
{{ include "amber.name" . }}
{{- end }}

{{/*
Name of the Volume
*/}}
{{- define "amber.volumeName" -}}
{{ include "amber.name" . }}
{{- end }}

{{/*
Name of the StatefulSet
*/}}
{{- define "amber.statefulSetName" -}}
{{ include "amber.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "amber.serviceName" -}}
{{ include "amber.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "amber.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "amber.selector" -}}
app.kubernetes.io/name: {{ include "amber.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "amber.metadata" -}}
labels:
  helm.sh/chart: {{ include "amber.chartLabel" . | quote }}
  {{- include "amber.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "amber.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "amber.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "amber.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "amber.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "amber.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "amber.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Volume
*/}}
{{- define "amber.volumeMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $volumeMetadata := (.Values.volume).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "amber.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $volumeMetadata $chartMetadata -}}
name: {{ include "amber.volumeName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "amber.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "amber.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the StatefulSet
*/}}
{{- define "amber.statefulSetMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $statefulSetMetadata := (.Values.statefulSet).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "amber.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $statefulSetMetadata $chartMetadata -}}
name: {{ include "amber.statefulSetName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "amber.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "amber.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "amber.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
