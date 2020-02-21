module "fortigate_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "${var.name}"
  description = "Security group used by Fortigate solution"
  vpc_id      = "${module.vpc.vpc_id}"

  ingress_rules       = ["all-all"]
  egress_rules        = ["all-all"]

}