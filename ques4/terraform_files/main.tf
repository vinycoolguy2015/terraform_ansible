provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
}

module "vpc" {
  source                    = "./vpc"
  vpc_cidr                  = "${var.vpc_cidr}"
  subnet_count              = "${var.subnet_count}"
  vpc_public_subnet_cidrs   = "${var.vpc_public_subnet_cidrs}"
  vpc_private_subnet_cidrs  = "${var.vpc_private_subnet_cidrs}"
}


