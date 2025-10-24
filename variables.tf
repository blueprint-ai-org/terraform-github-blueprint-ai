variable "platform_config_repository_name" {
	type=string
	description="Platform config repository name"
}
variable "istio_repository_name" {
	type=string
	description="Istio repository name"
}
variable "admin_repository_name" {
	type=string
	description="Admin repository name"
}
variable "admin_chart_name" {
	type=string
	description="Admin chart name"
}
variable "api_repository_name" {
	type=string
	description="Api repository name"
}
variable "api_chart_name" {
	type=string
	description="Api chart name"
}
variable "authentication_repository_name" {
	type=string
	description="Authentication repository name"
}
variable "authentication_chart_name" {
	type=string
	description="Authentication chart name"
}
variable "function_analytics_repository_name" {
	type=string
	description="Function analytics repository name"
}
variable "function_query_analytics_repository_name" {
	type=string
	description="Function query analytics repository name"
}
variable "function_upload_videos_repository_name" {
	type=string
	description="Function upload videos repository name"
}
variable "grafana_assets_repository_name" {
	type=string
	description="Grafana assets repository name"
}
variable "media_repository_name" {
	type=string
	description="Media repository name"
}
variable "media_chart_name" {
	type=string
	description="Media chart name"
}
variable "mongo_schemas_repository_name" {
	type=string
	description="Mongo schemas repository name"
}
variable "mtw_repository_name" {
	type=string
	description="Mtw repository name"
}
variable "mtw_chart_name" {
	type=string
	description="Mtw chart name"
}
variable "notification_repository_name" {
	type=string
	description="Notification repository name"
}
variable "notification_chart_name" {
	type=string
	description="Notification chart name"
}
variable "payment_repository_name" {
	type=string
	description="Payment repository name"
}
variable "payment_chart_name" {
	type=string
	description="Payment chart name"
}
variable "performance_repository_name" {
	type=string
	description="Performance repository name"
}
variable "protobuf_repository_name" {
	type=string
	description="Protobuf repository name"
}
variable "migrations_repository_name" {
	type=string
	description="Migrations repository name"
}
variable "migrations_chart_name" {
	type=string
	description="Migrations chart name"
}
variable "user_repository_name" {
	type=string
	description="User repository name"
}
variable "user_chart_name" {
	type=string
	description="User chart name"
}
variable "web_repository_name" {
	type=string
	description="Web repository name"
}
variable "web_chart_name" {
	type=string
	description="Web chart name"
}
variable "worker_repository_name" {
	type=string
	description="Worker repository name"
}
variable "worker_chart_name" {
	type=string
	description="Worker chart name"
}
variable "docker_username" {
	type=string
	description="Docker username"
}
variable "docker_password" {
	type=string
	description="Docker password"
}
variable "run_ci_cd_workload_identity_provider" {
	type=string
	description="Run ci cd workload identity provider"
}
variable "run_ci_cd_service_account_email_test" {
	type=string
	description="Run ci cd service account email test"
}
variable "run_ci_cd_service_account_email_production" {
	type=string
	description="Run ci cd service account email production"
}
variable "run_ci_cd_service_account_email_staging" {
	type=string
	description="Run ci cd service account email staging"
}
variable "run_service_account_email_test" {
	type=string
	description="Run service account email test"
}
variable "run_service_account_email_production" {
	type=string
	description="Run service account email production"
}
variable "run_service_account_email_staging" {
	type=string
	description="Run service account email staging"
}
variable "run_service_account_id_test" {
	type=string
	description="Run service account id test"
}
variable "run_service_account_id_production" {
	type=string
	description="Run service account id production"
}
variable "run_service_account_id_staging" {
	type=string
	description="Run service account id staging"
}

variable "GCP_REGION" {
	type=string
	description="Gcp region"
}
variable "GCP_ZONE" {
	type=string
	description="Gcp zone"
}
variable "NPM_TOKEN" {
	type=string
	description="Npm token"
}



