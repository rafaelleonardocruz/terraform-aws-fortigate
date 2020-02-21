module "key_pair" {
  source = "terraform-aws-modules/key-pair/aws"

  key_name   = "deploy-key-${var.name}"
  public_key = "${var.public_key}"

}
