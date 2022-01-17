module "vpc" {
  source  = "app.terraform.io/SummitEngineering/network/google"
  version = "3.4.0"
  # insert required variables here

   project_id   = "var.project"
   network_name = "summit-network"

credentials "app.terraform.io" {
    # valid user API token:
    token = "xxxxxx.atlasv1.zzzzzzzzzzzzz"
  }

subnets = [
  {
    subnet_name   = "summit-subnet"
    subnet_ip     = "10.100.10.0/24"
    subnet_region = var.region
  }
]

}

