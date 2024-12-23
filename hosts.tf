resource "local_file" "inventory" {
  content = templatefile("./template.tftpl",
    { master_ips = module.master_vm.vm_ips,
      worker_ips = module.worker_vm.vm_ips
  })

  filename = var.inventory_path
}
