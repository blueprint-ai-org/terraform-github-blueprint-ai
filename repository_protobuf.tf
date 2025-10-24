resource "github_repository" "protobuf" {
	name=var.protobuf_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "protobuf_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.protobuf.name
	permission="push"
}
resource "github_branch" "protobuf_main" {
	repository=github_repository.protobuf.name
	branch="main"
}
resource "github_branch_default" "protobuf" {
	repository=github_repository.protobuf.name
	branch=github_branch.protobuf_main.branch
}
resource "github_actions_secret" "protobuf_npm_token" {
	repository=github_repository.protobuf.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


