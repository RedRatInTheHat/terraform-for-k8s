module "master_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=1a892e1"

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
  source = "git::https://github.com/RedRatInTheHat/simple-vmg.git?ref=3fef736"

  group_name   = var.worker_instance_name
  instances_count = var.worker_instances_count

  service_account_id = var.service_account_id
  network_id         = module.vpc.network_id

  
  has_nat      = var.has_nat
  subnet_ids   = module.vpc.subnet_ids
  subnet_zones = [for subnet_info in module.vpc.subnet_info : subnet_info.zone]

  metadata = {
    user-data = data.template_file.cloudinit.rendered
  }

  target_group_name = var.workers_tg_name
}

module "bastion_vm" {
  source = "git::https://github.com/RedRatInTheHat/simple-vms.git?ref=1a892e1"

  instances_count = var.bastion_number

  instance_name = var.bastion_name
  image_family  = var.image_family

  subnets = [
    for subnet in module.vpc.subnet_info : {
      "subnet_id" : subnet.id,
      "subnet_zone" : subnet.zone
    }
  ]
  has_nat                   = var.has_nat_for_bastion
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
