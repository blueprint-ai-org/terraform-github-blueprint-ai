resource "github_repository" "authentication" {
	name=var.authentication_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "authentication_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.authentication.name
	permission="push"
}
resource "github_team_repository" "authentication_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.authentication.name
	permission="push"
}
resource "github_branch" "authentication_main" {
	repository=github_repository.authentication.name
	branch="main"
}
resource "github_branch_default" "authentication" {
	repository=github_repository.authentication.name
	branch=github_branch.authentication_main.branch
}
# resource "github_branch_protection_v3" "authentication_main" {
# 	repository=github_repository.authentication.name
# 	branch=github_branch.authentication_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "authentication_dev" {
	repository=github_repository.authentication.name
	branch="dev"
}
resource "github_branch" "authentication_test" {
	repository=github_repository.authentication.name
	branch="test"
}
resource "github_branch" "authentication_staging" {
	repository=github_repository.authentication.name
	branch="staging"
}
resource "github_actions_secret" "authentication_docker_username" {
	repository=github_repository.authentication.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "authentication_docker_password" {
	repository=github_repository.authentication.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "authentication_npm_token" {
	repository=github_repository.authentication.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


