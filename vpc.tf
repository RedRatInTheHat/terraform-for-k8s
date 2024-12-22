resource "yandex_vpc_network" "vpc" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = var.subnet_1_name
  zone           = var.subnet_1_zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = var.subnet_1_cidr
}

resource "yandex_vpc_subnet" "subnet-2" {
  name           = var.subnet_2_name
  zone           = var.subnet_3_zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = var.subnet_2_cidr
}


resource "yandex_vpc_subnet" "subnet-3" {
  name           = var.subnet_3_name
  zone           = var.subnet_3_zone
  network_id     = yandex_vpc_network.vpc.id
  v4_cidr_blocks = var.subnet_3_cidr
}
