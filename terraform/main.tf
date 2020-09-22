provider "yandex" {
  token     = "AgAAAABF0erDAATuwYsVIAWJk0Dphs4j9VI7PWg"
  cloud_id  = "b1gk9g7v8iomdnkpc4ha"
  folder_id = "b1gomgpjb36ugoplki3v"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # reddit-base-1600612434
      image_id = "fd8r2ajb1thombsio1od"
    }
  }

  network_interface {
    subnet_id = "e9b0cun4pcl3g6drdnvr"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/appuser.pub")}"
  }

  connection {
    type = "ssh"
    host = yandex_compute_instance.app.network_interface.0.nat_ip_address
    port = "22"
    user = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file("~/.ssh/appuser")
  }

  provisioner "file" {
    source = "files/puma.service"
    destination = "/tmp/puma.service"
  }

  provisioner "remote-exec" {
    script = "files/deploy.sh"
  }
}