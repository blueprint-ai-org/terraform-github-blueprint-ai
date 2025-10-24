resource "github_repository" "migrations" {
	name=var.migrations_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "migrations_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.migrations.name
	permission="push"
}
resource "github_team_repository" "migrations_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.migrations.name
	permission="push"
}
resource "github_branch" "migrations_main" {
	repository=github_repository.migrations.name
	branch="main"
}
resource "github_branch_default" "migrations" {
	repository=github_repository.migrations.name
	branch=github_branch.migrations_main.branch
}
# resource "github_branch_protection_v3" "migrations_main" {
# 	repository=github_repository.migrations.name
# 	branch=github_branch.migrations_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "migrations_dev" {
	repository=github_repository.migrations.name
	branch="dev"
}
resource "github_branch" "migrations_test" {
	repository=github_repository.migrations.name
	branch="test"
}
resource "github_branch" "migrations_staging" {
	repository=github_repository.migrations.name
	branch="staging"
}
resource "github_actions_secret" "migrations_docker_username" {
	repository=github_repository.migrations.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "migrations_docker_password" {
	repository=github_repository.migrations.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}


