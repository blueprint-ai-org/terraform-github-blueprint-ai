resource "github_repository" "mtw" {
	name=var.mtw_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "mtw_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.mtw.name
	permission="push"
}
resource "github_team_repository" "mtw_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.mtw.name
	permission="push"
}
resource "github_team_repository" "mtw_frontend" {
	team_id=data.github_team.frontend.id
	repository=github_repository.mtw.name
	permission="push"
}
resource "github_branch" "mtw_main" {
	repository=github_repository.mtw.name
	branch="main"
}
resource "github_branch_default" "mtw" {
	repository=github_repository.mtw.name
	branch=github_branch.mtw_main.branch
}
# resource "github_branch_protection_v3" "mtw_main" {
# 	repository=github_repository.mtw.name
# 	branch=github_branch.mtw_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "mtw_dev" {
	repository=github_repository.mtw.name
	branch="dev"
}
resource "github_branch" "mtw_test" {
	repository=github_repository.mtw.name
	branch="test"
}
resource "github_branch" "mtw_staging" {
	repository=github_repository.mtw.name
	branch="staging"
}
resource "github_actions_secret" "mtw_docker_username" {
	repository=github_repository.mtw.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "mtw_docker_password" {
	repository=github_repository.mtw.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "mtw_npm_token" {
	repository=github_repository.mtw.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


