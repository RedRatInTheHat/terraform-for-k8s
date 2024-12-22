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

# VPC

variable "vpc_name" {
  type        = string
  default     = "vpc"
  description = "The name of the VPC network to be created."
}

variable "subnet_1_name" {
  type        = string
  default     = "subnet-1"
  description = "The name of the first subnet."
}

variable "subnet_1_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "The availability zone for the first subnet."
}

variable "subnet_1_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "The CIDR block for the first subnet."
}

variable "subnet_2_name" {
  type        = string
  default     = "subnet-2"
  description = "The name of the second subnet."
}

variable "subnet_2_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "The availability zone for the second subnet."
}

variable "subnet_2_cidr" {
  type        = list(string)
  default     = ["192.168.11.0/24"]
  description = "The CIDR block for the second subnet."
}

variable "subnet_3_name" {
  type        = string
  default     = "subnet-3"
  description = "The name of the third subnet."
}

variable "subnet_3_zone" {
  type        = string
  default     = "ru-central1-d"
  description = "The availability zone for the third subnet."
}

variable "subnet_3_cidr" {
  type        = list(string)
  default     = ["192.168.12.0/24"]
  description = "The CIDR block for the third subnet."
}
