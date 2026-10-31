{{- define "erp-api.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "erp-api.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "erp-api.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "erp-api.labels" -}}
app.kubernetes.io/name: {{ include "erp-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ printf "%s-%s" .Chart.Name .Chart.Version }}
{{- end -}}

{{- define "erp-api.selectorLabels" -}}
app.kubernetes.io/name: {{ include "erp-api.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}
