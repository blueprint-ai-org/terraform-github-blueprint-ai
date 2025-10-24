resource "github_repository" "mongo_schemas" {
	name=var.mongo_schemas_repository_name
	visibility="private"
	has_issues=true
	auto_init=true
}
resource "github_team_repository" "mongo_schemas_backend" {
	team_id=data.github_team.backend.id
	repository=github_repository.mongo_schemas.name
	permission="push"
}
resource "github_branch" "mongo_schemas_main" {
	repository=github_repository.mongo_schemas.name
	branch="main"
}
resource "github_branch_default" "mongo_schemas" {
	repository=github_repository.mongo_schemas.name
	branch=github_branch.mongo_schemas_main.branch
}
resource "github_actions_secret" "mongo_schemas_npm_token" {
	repository=github_repository.mongo_schemas.name
	secret_name="NPM_TOKEN"
	plaintext_value=var.NPM_TOKEN
}


