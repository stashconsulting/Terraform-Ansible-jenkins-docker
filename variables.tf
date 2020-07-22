variable "project" {
  type = string
}

variable "machine_type"{
  type = string
  default = "n1-standard-1"
}

variable "boot_disk_image"{
  type = string
  default = "debian-cloud/debian-10"
}