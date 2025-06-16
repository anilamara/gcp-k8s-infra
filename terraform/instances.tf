data "template_file" "master_startup" {
  template = file("${path.module}/bootstrap-master.sh")
}

data "template_file" "worker_startup" {
  template = file("${path.module}/bootstrap-worker.sh")
}

# Master Instance
resource "google_compute_instance" "master" {
  name         = var.master_instance_name
  machine_type = "e2-standard-2"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {}
  }

  metadata_startup_script = data.template_file.master_startup.rendered
}

# Workers
resource "google_compute_instance" "workers" {
  count        = var.worker_instance_count
  name         = "k8s-worker-${count.index + 1}"
  machine_type = "e2-micro"
  zone         = "southamerica-east1-a"

  boot_disk {
    initialize_params {
      image = "ubuntu-2204-lts"
    }
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.subnet.name
    access_config {}
  }

  metadata_startup_script = data.template_file.worker_startup.rendered
}

