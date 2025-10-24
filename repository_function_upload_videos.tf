resource "github_repository" "function_upload_videos" {
	name=var.function_upload_videos_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "function_upload_videos_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.function_upload_videos.name
	permission="push"
}
resource "github_team_repository" "function_upload_videos_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.function_upload_videos.name
	permission="push"
}
resource "github_branch" "function_upload_videos_main" {
	repository=github_repository.function_upload_videos.name
	branch="main"
}
resource "github_branch_default" "function_upload_videos" {
	repository=github_repository.function_upload_videos.name
	branch=github_branch.function_upload_videos_main.branch
}
# resource "github_branch_protection_v3" "function_upload_videos_main" {
# 	repository=github_repository.function_upload_videos.name
# 	branch=github_branch.function_upload_videos_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "function_upload_videos_dev" {
	repository=github_repository.function_upload_videos.name
	branch="dev"
}
resource "github_branch" "function_upload_videos_test" {
	repository=github_repository.function_upload_videos.name
	branch="test"
}
resource "github_branch" "function_upload_videos_staging" {
	repository=github_repository.function_upload_videos.name
	branch="staging"
}
resource "github_actions_secret" "function_upload_videos_gcp_workload_identity_provider" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_WORKLOAD_IDENTITY_PROVIDER"
	plaintext_value=var.run_ci_cd_workload_identity_provider
}
resource "github_actions_secret" "function_upload_videos_gcp_service_account_email_test" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_SERVICE_ACCOUNT_EMAIL_TEST"
	plaintext_value=var.run_ci_cd_service_account_email_test
}
resource "github_actions_secret" "function_upload_videos_gcp_service_account_email_production" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_SERVICE_ACCOUNT_EMAIL_PRODUCTION"
	plaintext_value=var.run_ci_cd_service_account_email_production
}
resource "github_actions_secret" "function_upload_videos_gcp_service_account_email_staging" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_SERVICE_ACCOUNT_EMAIL_STAGING"
	plaintext_value=var.run_ci_cd_service_account_email_staging
}
resource "github_actions_secret" "function_upload_videos_gcp_run_service_account_email_test" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_RUN_SERVICE_ACCOUNT_EMAIL_TEST"
	plaintext_value=var.run_service_account_email_test
}
resource "github_actions_secret" "function_upload_videos_gcp_run_service_account_email_production" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_RUN_SERVICE_ACCOUNT_EMAIL_PRODUCTION"
	plaintext_value=var.run_service_account_email_production
}
resource "github_actions_secret" "function_upload_videos_gcp_run_service_account_email_staging" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_RUN_SERVICE_ACCOUNT_EMAIL_STAGING"
	plaintext_value=var.run_service_account_email_staging
}
resource "github_actions_secret" "function_upload_videos_gcp_run_service_account_id_test" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_RUN_SERVICE_ACCOUNT_ID_TEST"
	plaintext_value=var.run_service_account_id_test
}
resource "github_actions_secret" "function_upload_videos_gcp_run_service_account_id_production" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_RUN_SERVICE_ACCOUNT_ID_PRODUCTION"
	plaintext_value=var.run_service_account_id_production
}
resource "github_actions_secret" "function_upload_videos_gcp_run_service_account_id_staging" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_RUN_SERVICE_ACCOUNT_ID_STAGING"
	plaintext_value=var.run_service_account_id_staging
}
resource "github_actions_secret" "function_upload_videos_gcp_region" {
	repository=github_repository.function_upload_videos.name
	secret_name="GCP_REGION"
	plaintext_value=var.GCP_REGION
}


