# Tags
variable "name" {
  description = "Value of tag Name"
}

variable "team" {
  description = "Value of tag Team"
} 

variable "owner" {
  description = "Value of tag Owner"
}

variable "environment" {
  description = "Value of tag Environment"
}

variable "application" {
  description = "Value of tag Application"    
}

# VPC and Subnet
variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
    type = "list"
    default = ["us-east-1", "us-east-2", "us-east-3"]
  
}

# Fortigate device
variable "fg_count" {}

variable "fg_instance_type" {}
variable "fg_disk_size" {}
variable "fg_name" {}

variable "public_key" {
  description = "Enter your public key to access Fortigate instance"
}
