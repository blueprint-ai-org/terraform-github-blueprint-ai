resource "github_repository" "platform_config" {
	name=var.platform_config_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "platform_config_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.platform_config.name
	permission="push"
}
resource "github_team_repository" "platform_config_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.platform_config.name
	permission="pull"
}
resource "github_branch" "platform_config_main" {
	repository=github_repository.platform_config.name
	branch="main"
}
resource "github_branch_default" "platform_config" {
	repository=github_repository.platform_config.name
	branch=github_branch.platform_config_main.branch
}
# resource "github_branch_protection_v3" "platform_config_main" {
# 	repository=github_repository.platform_config.name
# 	branch=github_branch.platform_config_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_branch" "platform_config_test" {
	repository=github_repository.platform_config.name
	branch="test"
}
resource "github_branch" "platform_config_production" {
	repository=github_repository.platform_config.name
	branch="production"
}
resource "github_branch" "platform_config_staging" {
	repository=github_repository.platform_config.name
	branch="staging"
}
resource "github_actions_secret" "platform_config_docker_username" {
	repository=github_repository.platform_config.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "platform_config_docker_password" {
	repository=github_repository.platform_config.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}


