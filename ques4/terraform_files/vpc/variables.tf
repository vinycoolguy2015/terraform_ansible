variable "subnet_count" {}

variable "vpc_cidr" {}

variable "vpc_private_subnet_cidrs" {
  type = "list"
}

variable "vpc_public_subnet_cidrs" {
  type = "list"
}
