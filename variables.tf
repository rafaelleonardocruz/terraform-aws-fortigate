# Tags
variable "name" {
  
}

variable "team" {

} 

variable "owner" {

}

variable "environment" {

}

variable "application" {
    
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
