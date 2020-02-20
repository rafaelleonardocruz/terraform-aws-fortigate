data "aws_caller_identity" "current" {}

data "aws_ami" "fortigate" {
  most_recent = true

  filter {
    name   = "name"
    values = ["FortiGate-VM64-AWSONDEMAND build0932 (6.2.1) GA-3124a694-441c-4ff1-8bf7-4d153be424a6-ami-094f6bfd5592431e0.4"]
  }

  owners = ["679593333241"] # Owner ID Fortinet
}

