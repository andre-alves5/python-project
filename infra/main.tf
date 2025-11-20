module "vpc" {
  source = "./modules/networking"

  env             = var.env
  vpc-cidr-block  = var.vpc-cidr-block
  azs             = var.azs
  private-subnets = var.private-subnets
  public-subnets  = var.public-subnets
}
