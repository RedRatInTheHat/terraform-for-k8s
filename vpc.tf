module "vpc_dev" {
  source = "git::https://github.com/RedRatInTheHat/simple-vpc.git?ref=36f6f3c"

  vpc_name = "vpc"
  vpc_subnets = [
    { vpc_zone = "ru-central1-a", vpc_cidr = "192.168.10.0/24" },
    { vpc_zone = "ru-central1-b", vpc_cidr = "192.168.11.0/24" },
    { vpc_zone = "ru-central1-d", vpc_cidr = "192.168.12.0/24" },
  ]
}
