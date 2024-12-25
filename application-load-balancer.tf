module "ab" {
  source = "git::https://github.com/RedRatInTheHat/simple-ab.git?ref=5a42be1"

  alb_backend_group_name = var.alb_backend_group_name
  http_backend_name      = var.http_backend_name
  alb_router_name        = var.alb_router_name
  alb_virtual_host_name  = var.alb_virtual_host_name
  route_name             = var.route_name
  alb_load_balancer_name = var.alb_load_balancer_name
  listener_name          = var.listener_name
  healthcheck_host       = var.healthcheck_host

  target_group_ids = [module.worker_vm.target_group_id]
  network_id       = module.vpc.network_id
  subnet_info      = module.vpc.private_subnet_info
}
