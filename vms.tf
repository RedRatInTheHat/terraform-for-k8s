module "master_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=510d533"

  instances_count = 3

  instance_name = "master"
  image_family  = "ubuntu-2004-lts"

  subnets = [
    for subnet in module.vpc.subnet_info : {
      "subnet_id" : subnet.id,
      "subnet_zone" : subnet.zone
    }
  ]
  has_nat                   = true
  allow_stopping_for_update = true
  platform_id               = "standard-v3"
  is_preemptible            = true

  resources = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }
}

module "worker_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=510d533"

  instances_count = 3

  instance_name = "worker"
  image_family  = "ubuntu-2004-lts"

  subnets = [
    for subnet in module.vpc.subnet_info : {
      "subnet_id" : subnet.id,
      "subnet_zone" : subnet.zone
    }
  ]
  has_nat                   = true
  allow_stopping_for_update = true
  platform_id               = "standard-v3"
  is_preemptible            = true

  resources = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }
}

data "template_file" "cloudinit" {
  template = file("./cloud-init.yml")

  vars = {
    ssh_key = var.vms_ssh_key
  }
}
