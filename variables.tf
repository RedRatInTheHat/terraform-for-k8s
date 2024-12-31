variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "sa_key_file_path" {
  type        = string
  default     = "~/key.json"
  description = "The path to the service account key file"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vms_ssh_key" {
  type        = string
  description = "SSH key for cluster vms user"
}

variable "service_account_id" {
  type        = string
  description = "The ID of the service account"
}

# Cluster machines

variable "master_instances_count" {
  type        = number
  default     = 3
  description = "Number of instances to create."
}

variable "worker_instances_count" {
  type        = number
  default     = 3
  description = "Number of instances to create."
}

variable "master_instance_name" {
  type        = string
  default     = "master"
  description = "Name of the instance."
}

variable "worker_instance_name" {
  type        = string
  default     = "workers"
  description = "Name of the instance."
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The image family to use for the instance."
}

variable "has_nat" {
  type        = bool
  default     = false
  description = "Whether to enable NAT for the instance."
}

variable "is_allowed_stopping_for_update" {
  type        = bool
  default     = true
  description = "Whether to allow stopping the instance for updates."
}

variable "platform_id" {
  type        = string
  default     = "standard-v3"
  description = "The platform ID for the instance."
}

variable "is_preemptible" {
  type        = bool
  default     = false
  description = "Whether the instance is preemptible."
}

variable "resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 4
    memory        = 4
    core_fraction = 20
  }
  description = "Resource configuration for the instance."
}

variable "workers_tg_name" {
  type        = string
  default     = "workers-tg"
  description = "Name of the Target Group."
}

# Bastion

variable "bastion_number" {
  type        = string
  default     = 1
  description = "Number of bastion hosts (why would you need more than one? who knows)"
}

variable "bastion_name" {
  type        = string
  default     = "bastion"
  description = "Bastion Host instance name"
}

variable "has_nat_for_bastion" {
  type        = bool
  default     = true
  description = "Whether bastion host has public ip. But of course!"
}

# VPC

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "Name of the VPC."
}

variable "vpc_private_subnets" {
  type = list(object({
    vpc_zone = string
    vpc_cidr = string
  }))
  default = [
    { vpc_zone = "ru-central1-a", vpc_cidr = "192.168.10.0/24" },
    { vpc_zone = "ru-central1-b", vpc_cidr = "192.168.11.0/24" },
    { vpc_zone = "ru-central1-d", vpc_cidr = "192.168.12.0/24" },
  ]
  description = "List of public subnets for the VPC, including zone and CIDR."
}

variable "vpc_public_subnets" {
  type = list(object({
    vpc_zone = string
    vpc_cidr = string
  }))
  default = [
    { vpc_zone = "ru-central1-d", vpc_cidr = "192.168.13.0/24" },
  ]
  description = "List of private subnets for the VPC, including zone and CIDR."
}

# Hosts

variable "inventory_path" {
  type        = string
  default     = "inventory.yaml"
  description = "The path where inventory file will be created at"
}

# Load Balancer

variable "alb_backend_group_name" {
  type        = string
  default     = "alb-bg"
  description = "The name of the ALB Backend Group."
}

variable "http_backend_name" {
  type        = string
  default     = "backend-1"
  description = "The name of the HTTP backend."
}

variable "alb_router_name" {
  type        = string
  default     = "alb-router"
  description = "The name of the ALB HTTP Router."
}

variable "alb_virtual_host_name" {
  type        = string
  default     = "alb-host"
  description = "The name of the ALB Virtual Host."
}

variable "route_name" {
  type        = string
  default     = "route-1"
  description = "The name of the route within the Virtual Host."
}

variable "alb_load_balancer_name" {
  type        = string
  default     = "alb-1"
  description = "The name of the ALB Load Balancer."
}

variable "listener_name" {
  type        = string
  default     = "alb-listener"
  description = "The name of the listener for the Load Balancer."
}

variable "healthcheck_host" {
  type        = string
  default     = "static.redrat.diploma"
  description = "'Host' header for healthcheck"
}
