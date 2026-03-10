
terraform {
  backend "local" {
    path = "/home/github-runner/terraform-state/homelab.tfstate"
  }
}