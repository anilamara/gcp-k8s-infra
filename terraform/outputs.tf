output "master_external_ip" {
  value = google_compute_instance.master.network_interface[0].access_config[0].nat_ip
}

output "worker_external_ips" {
  value = google_compute_instance.workers[*].network_interface[0].access_config[0].nat_ip
}

