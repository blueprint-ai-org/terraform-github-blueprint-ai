resource "github_repository" "api" {
	name=var.api_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "api_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.api.name
	permission="push"
}
resource "github_team_repository" "api_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.api.name
	permission="push"
}
resource "github_branch" "api_main" {
	repository=github_repository.api.name
	branch="main"
}
resource "github_branch_default" "api" {
	repository=github_repository.api.name
	branch=github_branch.api_main.branch
}
# resource "github_branch_protection_v3" "api_main" {
# 	repository=github_repository.api.name
# 	branch=github_branch.api_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "api_dev" {
	repository=github_repository.api.name
	branch="dev"
}
resource "github_branch" "api_test" {
	repository=github_repository.api.name
	branch="test"
}
resource "github_branch" "api_staging" {
	repository=github_repository.api.name
	branch="staging"
}
resource "github_actions_secret" "api_docker_username" {
	repository=github_repository.api.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "api_docker_password" {
	repository=github_repository.api.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "api_npm_token" {
	repository=github_repository.api.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


