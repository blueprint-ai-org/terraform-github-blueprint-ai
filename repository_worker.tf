resource "github_repository" "worker" {
	name=var.worker_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "worker_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.worker.name
	permission="push"
}
resource "github_team_repository" "worker_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.worker.name
	permission="push"
}
resource "github_branch" "worker_main" {
	repository=github_repository.worker.name
	branch="main"
}
resource "github_branch_default" "worker" {
	repository=github_repository.worker.name
	branch=github_branch.worker_main.branch
}
# resource "github_branch_protection_v3" "worker_main" {
# 	repository=github_repository.worker.name
# 	branch=github_branch.worker_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "worker_dev" {
	repository=github_repository.worker.name
	branch="dev"
}
resource "github_branch" "worker_test" {
	repository=github_repository.worker.name
	branch="test"
}
resource "github_branch" "worker_staging" {
	repository=github_repository.worker.name
	branch="staging"
}
resource "github_actions_secret" "worker_docker_username" {
	repository=github_repository.worker.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "worker_docker_password" {
	repository=github_repository.worker.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "worker_npm_token" {
	repository=github_repository.worker.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


