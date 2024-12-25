module "vpc" {
  source = "git::https://github.com/RedRatInTheHat/simple-vpc.git?ref=bdf6240"

  vpc_name    = var.vpc_name
  vpc_public_subnets = var.vpc_public_subnets
  vpc_private_subnets = var.vpc_private_subnets
}
