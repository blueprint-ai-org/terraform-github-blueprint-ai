resource "github_repository" "admin" {
	name=var.admin_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "admin_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.admin.name
	permission="push"
}
resource "github_team_repository" "admin_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.admin.name
	permission="push"
}
resource "github_team_repository" "admin_frontend" {
	team_id=data.github_team.frontend.id
	repository=github_repository.admin.name
	permission="push"
}
resource "github_branch" "admin_main" {
	repository=github_repository.admin.name
	branch="main"
}
resource "github_branch_default" "admin" {
	repository=github_repository.admin.name
	branch=github_branch.admin_main.branch
}
# resource "github_branch_protection_v3" "admin_main" {
# 	repository=github_repository.admin.name
# 	branch=github_branch.admin_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "admin_dev" {
	repository=github_repository.admin.name
	branch="dev"
}
resource "github_branch" "admin_test" {
	repository=github_repository.admin.name
	branch="test"
}
resource "github_branch" "admin_staging" {
	repository=github_repository.admin.name
	branch="staging"
}
resource "github_actions_secret" "admin_docker_username" {
	repository=github_repository.admin.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "admin_docker_password" {
	repository=github_repository.admin.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "admin_npm_token" {
	repository=github_repository.admin.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}

