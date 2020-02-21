module "fortigate" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  name                   = "${var.name}-${count.index}"
  instance_count         = "${var.fg_count}"

  ami                    = "${data.aws_ami.fortigate.id}"
  instance_type          = "${var.fgt_instance_type}"
  key_name               = "${module.key_pair.this_key_pair_key_name}"
  monitoring             = true
  #subnet_id              = "${element(module.vpc.public_subnets, 0)}"
  subnet_ids             = "${module.vpc.public_subnets}"
  iam_instance_profile   = ""

  network_interface = [
    {
      device_index          = 0
      network_interface_id  = aws_network_interface.public_interface[count.index].id
      delete_on_termination = false
    },
    {
      device_index          = 1
      network_interface_id  = aws_network_interface.private_interface[count.index].id
      delete_on_termination = false
    }
  ]

  tags = "${merge(
    local.tags,
  )}"
}


resource "aws_network_interface" "public_interface" {
  count = "${var.fg_count}"

  subnet_id = tolist(module.vpc.public_subnets)[count.index]
  security_groups = ["${module.fortigate_sg.this_security_group_id}"]
  source_dest_check = false

  tags = {
       Name        = "${var.name}-public-${count.index}"
       Team        = "${var.team}"
       Owner       = "${var.owner}"
       Environment = "${var.environment}"
       Application = "${var.application}"
       Terraform   = "true"
  }
}

resource "aws_network_interface" "private_interface" {
  count = "${var.fg_count}"

  subnet_id = tolist(module.vpc.private_subnets)[count.index]
  security_groups = ["${module.fortigate_sg.this_security_group_id}"]
  source_dest_check = false

  tags = {
       Name        = "${var.name}-private-${count.index}"
       Team        = "${var.team}"
       Owner       = "${var.owner}"
       Environment = "${var.environment}"
       Application = "${var.application}"
       Terraform   = "true"
  }
}