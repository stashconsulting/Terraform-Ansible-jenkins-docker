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

variable "gce_ssh_user"{
  type =  string
  default = "gnsslvrz23"
}

variable "gce_ssh_pub_key_file"{
  type = string
  default = "~/.ssh/ssh-key.pub"
}

variable "service_account"{
  type = string
}
