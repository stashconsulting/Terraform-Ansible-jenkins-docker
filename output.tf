output "compute_instance_external_ip_address" {
    value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}