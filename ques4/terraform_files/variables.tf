variable "subnet_count" {}

variable "vpc_cidr" {}

variable "vpc_private_subnet_cidrs" {
  type = "list"
}

variable "vpc_public_subnet_cidrs" {
  type = "list"
}

variable "db_storage" {}

variable "db_maxstorage" {}

variable "dbinstance_clas" {}

variable "username" {}

variable "dbpassword" {}

variable "dbsubnet" {}

variable "rds_security_group" {}

variable "rds_name" {}

variable "aws_region" {}
