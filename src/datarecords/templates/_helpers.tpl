{{/*
Name of the database

By default, it is the name of the chart.
But it can be overridden with the `name` value.

For safety, it will be truncated to 63 characters.
That's because some Kubernetes name fields have limits.
*/}}
{{- define "datarecords.name" -}}
{{ .Values.name | default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Name of the Container
*/}}
{{- define "datarecords.containerName" -}}
{{ include "datarecords.name" . }}
{{- end }}

{{/*
Name of the Secret
*/}}
{{- define "datarecords.secretName" -}}
{{ include "datarecords.name" . }}
{{- end }}

{{/*
Name of the ConfigMap
*/}}
{{- define "datarecords.configMapName" -}}
{{ include "datarecords.name" . }}
{{- end }}

{{/*
Name of the Volume
*/}}
{{- define "datarecords.volumeName" -}}
{{ include "datarecords.name" . }}
{{- end }}

{{/*
Name of the StatefulSet
*/}}
{{- define "datarecords.statefulSetName" -}}
{{ include "datarecords.name" . }}
{{- end }}

{{/*
Name of the Service
*/}}
{{- define "datarecords.serviceName" -}}
{{ include "datarecords.name" . }}
{{- end }}

{{/*
Chart label to use to identify the chart version

It is a combination of the chart name and the chart version.
Some normalization is done to make it a valid label value.
*/}}
{{- define "datarecords.chartLabel" -}}
{{ printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Labels to use in selectors
*/}}
{{- define "datarecords.selector" -}}
app.kubernetes.io/name: {{ include "datarecords.name" . | quote }}
app.kubernetes.io/instance: {{ .Release.Name | quote }}
{{- end }}

{{/*
Common metadata defined in the chart
*/}}
{{- define "datarecords.metadata" -}}
labels:
  helm.sh/chart: {{ include "datarecords.chartLabel" . | quote }}
  {{- include "datarecords.selector" . | nindent 2 }}
  {{- with .Chart.AppVersion }}
  app.kubernetes.io/version: {{ . | quote }}
  {{- end }}
  app.kubernetes.io/managed-by: {{ .Release.Service | quote }}
{{- end }}

{{/*
Metadata to use in the Secret
*/}}
{{- define "datarecords.secretMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $secretMetadata := (.Values.secret).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "datarecords.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $secretMetadata $chartMetadata -}}
name: {{ include "datarecords.secretName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the ConfigMap
*/}}
{{- define "datarecords.configMapMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $configMapMetadata := (.Values.configMap).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "datarecords.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $configMapMetadata $chartMetadata -}}
name: {{ include "datarecords.configMapName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Volume
*/}}
{{- define "datarecords.volumeMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $volumeMetadata := (.Values.volume).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "datarecords.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $volumeMetadata $chartMetadata -}}
name: {{ include "datarecords.volumeName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Pod
*/}}
{{- define "datarecords.podMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $podMetadata := (.Values.pod).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "datarecords.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $podMetadata $chartMetadata -}}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the StatefulSet
*/}}
{{- define "datarecords.statefulSetMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $statefulSetMetadata := (.Values.statefulSet).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "datarecords.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $statefulSetMetadata $chartMetadata -}}
name: {{ include "datarecords.statefulSetName" . | quote }}
{{ toYaml $metadata }}
{{- end }}

{{/*
Metadata to use in the Service
*/}}
{{- define "datarecords.serviceMetadata" -}}
{{- $commonMetadata := (.Values.common).metadata | default dict | deepCopy }}
{{- $serviceMetadata := (.Values.service).metadata | default dict | deepCopy }}
{{- $chartMetadata := include "datarecords.metadata" . | fromYaml | deepCopy }}
{{- $metadata := mergeOverwrite $commonMetadata $serviceMetadata $chartMetadata -}}
name: {{ include "datarecords.serviceName" . | quote }}
{{ toYaml $metadata }}
{{- end }}
