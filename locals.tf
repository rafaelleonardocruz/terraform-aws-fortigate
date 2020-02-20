locals {
    tags = {
       Name        = "${var.name}"
       Team        = "${var.team}"
       Owner       = "${var.owner}"
       Environment = "${var.environment}"
       Application = "${var.application}"
       Terraform   = "true"
  }
}
