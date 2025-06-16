resource "google_compute_firewall" "allow-all" {
  name    = "allow-all"
  network = google_compute_network.vpc_network.name

  allow {
    protocol = "tcp"
    ports    = ["22", "80", "443", "6443", "2379-2380", "10250", "10251", "10252", "30000-32767"]
  }

  allow {
    protocol = "icmp"
  }

  source_ranges = ["0.0.0.0/0"]
}

