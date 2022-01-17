module "vpc" {
  source  = "app.terraform.io/SummitEngineering/network/google"
  version = "3.4.0"
  # insert required variables here

   project_id   = "summit.project"
   network_name = "summit-network"


subnets = [
  {
    subnet_name   = "summit-subnet"
    subnet_ip     = "10.100.10.0/24"
    subnet_region = var.region
  }
]

}

resource "google_compute_instance" "hashicat" {
  name         = "${var.prefix}-hashicat"
  zone         = "${var.region}-b"
  machine_type = var.machine_type


  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.hashicat.self_link
    access_config {
    }
  }

  metadata = {
    ssh-keys = "ubuntu:${chomp(tls_private_key.ssh-key.public_key_openssh)} terraform"
  }

  tags = ["http-server"]

  labels = {
    name = "hashicat"
    department   = "devops"
    billable     = "true"
  }

}
