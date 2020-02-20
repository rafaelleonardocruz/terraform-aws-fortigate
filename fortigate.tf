module "fortigate" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "my-cluster"
  instance_count         = "${var.fg_count}"

  ami                    = "${data.aws_ami.fortigate.id}"
  associate_public_ip_addess = true
  instance_type          = "${var.fgt_instance_type}"
  key_name               = ""
  monitoring             = true
  vpc_security_group_ids = [""]
  subnet_id              = "${element(module.vpc.public_subnets, 0)}"

  tags = "${merge(
    local.tags,
  )}"
}

