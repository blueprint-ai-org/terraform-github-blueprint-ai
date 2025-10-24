resource "github_repository" "istio" {
	name=var.istio_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "istio_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.istio.name
	permission="push"
}
resource "github_team_repository" "istio_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.istio.name
	permission="pull"
}
resource "github_branch" "istio_main" {
	repository=github_repository.istio.name
	branch="main"
}
resource "github_branch_default" "istio" {
	repository=github_repository.istio.name
	branch=github_branch.istio_main.branch
}
# resource "github_branch_protection_v3" "istio_main" {
# 	repository=github_repository.istio.name
# 	branch=github_branch.istio_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_actions_secret" "istio_docker_username" {
	repository=github_repository.istio.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "istio_docker_password" {
	repository=github_repository.istio.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}


