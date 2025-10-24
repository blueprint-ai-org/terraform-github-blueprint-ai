terraform {
	backend "remote" {
		hostname="app.terraform.io"
		organization="blueprint-ai"
		workspaces {
			name="app-dev-example"
		}
	}
}

module "two_bridge_github" {
	source="app.terraform.io/blueprint-ai/blueprint-ai/github"
	version="1.0.0"
}