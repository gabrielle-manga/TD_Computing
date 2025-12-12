resource "google_compute_network" "cm_network" {
  name                    = "cm-network"
  auto_create_subnetworks = true
}

resource "google_compute_instance" "vm1" {
  name         = "vm1"
  machine_type = "e2-micro"
  zone         = "europe-west9-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = google_compute_network.cm_network.name

    access_config {
      # IP publique
    }
  }
}
