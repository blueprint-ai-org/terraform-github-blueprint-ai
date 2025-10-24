resource "github_repository" "notification" {
	name=var.notification_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "notification_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.notification.name
	permission="push"
}
resource "github_team_repository" "notification_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.notification.name
	permission="push"
}
resource "github_branch" "notification_main" {
	repository=github_repository.notification.name
	branch="main"
}
resource "github_branch_default" "notification" {
	repository=github_repository.notification.name
	branch=github_branch.notification_main.branch
}
# resource "github_branch_protection_v3" "notification_main" {
# 	repository=github_repository.notification.name
# 	branch=github_branch.notification_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "notification_dev" {
	repository=github_repository.notification.name
	branch="dev"
}
resource "github_branch" "notification_test" {
	repository=github_repository.notification.name
	branch="test"
}
resource "github_branch" "notification_staging" {
	repository=github_repository.notification.name
	branch="staging"
}
resource "github_actions_secret" "notification_docker_username" {
	repository=github_repository.notification.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "notification_docker_password" {
	repository=github_repository.notification.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "notification_npm_token" {
	repository=github_repository.notification.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


