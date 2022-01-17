terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "SummitEngineering"
    workspaces {
      name = "hashicat-gcp"
    }
  }
}
