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
  type = string
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
  default     = "worker"
  description = "Name of the instance."
}

variable "image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The image family to use for the instance."
}

variable "has_nat" {
  type        = bool
  default     = true
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
  default     = true
  description = "Whether the instance is preemptible."
}

variable "resources" {
  type = object({
    cores         = number
    memory        = number
    core_fraction = number
  })
  default = {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }
  description = "Resource configuration for the instance."
}

# VPC

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "Name of the VPC."
}

variable "vpc_subnets" {
  type = list(object({
    vpc_zone = string
    vpc_cidr = string
  }))
  default = [
    { vpc_zone = "ru-central1-a", vpc_cidr = "192.168.10.0/24" },
    { vpc_zone = "ru-central1-b", vpc_cidr = "192.168.11.0/24" },
    { vpc_zone = "ru-central1-d", vpc_cidr = "192.168.12.0/24" },
  ]
  description = "List of subnets for the VPC, including zone and CIDR."
}

# Hosts

variable "inventory_path" {
  type        = string
  default     = "inventory.yaml"
  description = "The path where inventory file will be created at"
}
