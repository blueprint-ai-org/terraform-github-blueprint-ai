resource "github_repository" "payment" {
	name=var.payment_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "payment_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.payment.name
	permission="push"
}
resource "github_team_repository" "payment_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.payment.name
	permission="push"
}
resource "github_branch" "payment_main" {
	repository=github_repository.payment.name
	branch="main"
}
resource "github_branch_default" "payment" {
	repository=github_repository.payment.name
	branch=github_branch.payment_main.branch
}
# resource "github_branch_protection_v3" "payment_main" {
# 	repository=github_repository.payment.name
# 	branch=github_branch.payment_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "payment_dev" {
	repository=github_repository.payment.name
	branch="dev"
}
resource "github_branch" "payment_test" {
	repository=github_repository.payment.name
	branch="test"
}
resource "github_branch" "payment_staging" {
	repository=github_repository.payment.name
	branch="staging"
}
resource "github_actions_secret" "payment_docker_username" {
	repository=github_repository.payment.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "payment_docker_password" {
	repository=github_repository.payment.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}
resource "github_actions_secret" "payment_npm_token" {
	repository=github_repository.payment.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


