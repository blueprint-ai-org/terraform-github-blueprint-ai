resource "github_repository" "web" {
	name=var.web_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "web_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.web.name
	permission="push"
}
resource "github_team_repository" "web_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.web.name
	permission="push"
}
resource "github_team_repository" "web_frontend" {
	team_id=data.github_team.frontend.id
	repository=github_repository.web.name
	permission="push"
}
resource "github_branch" "web_main" {
	repository=github_repository.web.name
	branch="main"
}
resource "github_branch_default" "web" {
	repository=github_repository.web.name
	branch=github_branch.web_main.branch
}
# resource "github_branch_protection_v3" "web_main" {
# 	repository=github_repository.web.name
# 	branch=github_branch.web_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "web_dev" {
	repository=github_repository.web.name
	branch="dev"
}
resource "github_branch" "web_test" {
	repository=github_repository.web.name
	branch="test"
}
resource "github_branch" "web_staging" {
	repository=github_repository.web.name
	branch="staging"
}
resource "github_actions_secret" "web_docker_username" {
	repository=github_repository.web.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "web_docker_password" {
	repository=github_repository.web.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "web_npm_token" {
	repository=github_repository.web.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


