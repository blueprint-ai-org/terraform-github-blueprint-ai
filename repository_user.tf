resource "github_repository" "user" {
	name=var.user_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "user_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.user.name
	permission="push"
}
resource "github_team_repository" "user_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.user.name
	permission="push"
}
resource "github_branch" "user_main" {
	repository=github_repository.user.name
	branch="main"
}
resource "github_branch_default" "user" {
	repository=github_repository.user.name
	branch=github_branch.user_main.branch
}
# resource "github_branch_protection_v3" "user_main" {
# 	repository=github_repository.user.name
# 	branch=github_branch.user_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "user_dev" {
	repository=github_repository.user.name
	branch="dev"
}
resource "github_branch" "user_test" {
	repository=github_repository.user.name
	branch="test"
}
resource "github_branch" "user_staging" {
	repository=github_repository.user.name
	branch="staging"
}
resource "github_actions_secret" "user_docker_username" {
	repository=github_repository.user.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "user_docker_password" {
	repository=github_repository.user.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "user_npm_token" {
	repository=github_repository.user.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


