data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "test-org004"
    workspaces = {
      name = "terraform-aws-network"
    }
  }
}
