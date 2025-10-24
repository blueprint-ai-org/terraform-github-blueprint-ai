resource "github_repository" "grafana_assets" {
	name=var.grafana_assets_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "grafana_assets_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.grafana_assets.name
	permission="push"
}
resource "github_team_repository" "grafana_assets_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.grafana_assets.name
	permission="push"
}
resource "github_branch" "grafana_assets_main" {
	repository=github_repository.grafana_assets.name
	branch="main"
}
resource "github_branch_default" "grafana_assets" {
	repository=github_repository.grafana_assets.name
	branch=github_branch.grafana_assets_main.branch
}


