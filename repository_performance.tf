resource "github_repository" "performance" {
	name=var.performance_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "performance_devops" {
	team_id=data.github_team.devops.id
	repository=github_repository.performance.name
	permission="push"
}
resource "github_team_repository" "performance_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.performance.name
	permission="push"
}
resource "github_branch" "performance_main" {
	repository=github_repository.performance.name
	branch="main"
}
resource "github_branch_default" "performance" {
	repository=github_repository.performance.name
	branch=github_branch.performance_main.branch
}


