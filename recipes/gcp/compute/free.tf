# Define provider and authentication
provider "google" {
  credentials = file("${var.credentials_file}")
  project     = var.project_id
  region      = "us-central1"
}

# Create a new instance
resource "google_compute_instance" "my_instance" {
  name         = "my-instance"
  machine_type = "f1-micro" # Free-tier machine type

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10" 
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Include this block to give the instance a public IP address
    }
  }

  metadata = {
    // Add any additional metadata here if needed
  }

  tags = ["http-server", "https-server"]
}
