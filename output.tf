output "compute_instance_external_ip_address" {
    value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}

output "URI_bucket" {
    value = google_container_registry.registry.bucket_self_link
}

output "container_registry_bucket_name" {
    value = google_container_registry.registry.id
}
