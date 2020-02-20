module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "${var.name}"
  cidr = "${var.vpc_cidr}"

  azs             = "${var.azs}"
  private_subnets = ["${cidrsubnet(var.vpc_cidr, 8, 100 )}", "${cidrsubnet(var.vpc_cidr, 8, 101 )}", "${cidrsubnet(var.vpc_cidr, 8, 102 )}"]
  public_subnets  = ["${cidrsubnet(var.vpc_cidr, 8, 10 )}", "${cidrsubnet(var.vpc_cidr, 8, 11 )}", "${cidrsubnet(var.vpc_cidr, 8, 10 )}"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = "${merge(
    local.tags,
  )}"
}