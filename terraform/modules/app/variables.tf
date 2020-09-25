variable public_key_path {
  description = "Path to the public key used for ssh access"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "fd80idg2bhj9g0491pj4"
}
variable subnet_id {
    description = "Subnets for modules"
}
