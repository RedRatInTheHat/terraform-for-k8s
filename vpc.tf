module "vpc" {
  source = "git::https://github.com/RedRatInTheHat/simple-vpc.git?ref=36f6f3c"

  vpc_name    = var.vpc_name
  vpc_subnets = var.vpc_subnets
}
