module "master_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=510d533"

  instances_count = var.master_instances_count

  instance_name = var.master_instance_name
  image_family  = var.image_family

  subnets = [
    for subnet in module.vpc.subnet_info : {
      "subnet_id" : subnet.id,
      "subnet_zone" : subnet.zone
    }
  ]
  has_nat                   = var.has_nat
  allow_stopping_for_update = var.is_allowed_stopping_for_update
  platform_id               = var.platform_id
  is_preemptible            = var.is_preemptible

  resources = {
    cores         = var.resources.cores
    memory        = var.resources.memory
    core_fraction = var.resources.core_fraction
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }
}

module "worker_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=510d533"

  instances_count = var.worker_instances_count

  instance_name = var.worker_instance_name
  image_family  = var.image_family

  subnets = [
    for subnet in module.vpc.subnet_info : {
      "subnet_id" : subnet.id,
      "subnet_zone" : subnet.zone
    }
  ]
  has_nat                   = var.has_nat
  allow_stopping_for_update = var.is_allowed_stopping_for_update
  platform_id               = var.platform_id
  is_preemptible            = var.is_preemptible

  resources = {
    cores         = var.resources.cores
    memory        = var.resources.memory
    core_fraction = var.resources.core_fraction
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
