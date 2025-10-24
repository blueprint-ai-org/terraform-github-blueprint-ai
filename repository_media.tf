resource "github_repository" "media" {
	name=var.media_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "media_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.media.name
	permission="push"
}
resource "github_team_repository" "media_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.media.name
	permission="push"
}
resource "github_branch" "media_main" {
	repository=github_repository.media.name
	branch="main"
}
resource "github_branch_default" "media" {
	repository=github_repository.media.name
	branch=github_branch.media_main.branch
}
# resource "github_branch_protection_v3" "media_main" {
# 	repository=github_repository.media.name
# 	branch=github_branch.media_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "media_dev" {
	repository=github_repository.media.name
	branch="dev"
}
resource "github_branch" "media_test" {
	repository=github_repository.media.name
	branch="test"
}
resource "github_branch" "media_staging" {
	repository=github_repository.media.name
	branch="staging"
}
resource "github_actions_secret" "media_docker_username" {
	repository=github_repository.media.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "media_docker_password" {
	repository=github_repository.media.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "media_npm_token" {
	repository=github_repository.media.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


