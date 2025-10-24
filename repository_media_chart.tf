resource "github_repository" "media_chart" {
	name=var.media_chart_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "media_chart_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.media_chart.name
	permission="push"
}
resource "github_team_repository" "media_chart_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.media_chart.name
	permission="pull"
}
resource "github_branch" "media_chart_main" {
	repository=github_repository.media_chart.name
	branch="main"
}
resource "github_branch_default" "media_chart" {
	repository=github_repository.media_chart.name
	branch=github_branch.media_chart_main.branch
}
# resource "github_branch_protection_v3" "media_chart_main" {
# 	repository=github_repository.media_chart.name
# 	branch=github_branch.media_chart_main.branch
# 	restrictions {
# 		teams=[data.github_team.devops.slug]
# 	}
# }
resource "github_actions_secret" "media_chart_docker_username" {
	repository=github_repository.media_chart.name
	secret_name="DOCKER_USERNAME"
	plaintext_value=var.docker_username
}
resource "github_actions_secret" "media_chart_docker_password" {
	repository=github_repository.media_chart.name
	secret_name="DOCKER_PASSWORD"
	plaintext_value=var.docker_password
}


