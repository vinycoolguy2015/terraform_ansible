provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source                   = "./vpc"
  vpc_cidr                 = var.vpc_cidr
  subnet_count             = var.subnet_count
  vpc_public_subnet_cidrs  = var.vpc_public_subnet_cidrs
  vpc_private_subnet_cidrs = var.vpc_private_subnet_cidrs
}

module "rds" {
  source                   = "./rds"
  db_storage               = var.db_storage
  dbinstance_class         = var.dbinstance_class
  dbuser                   = var.dbuser
  dbpassword               = var.dbpassword
  dbsubnet                 = module.vpc.rds_subnetgroup
  rds_security_group       = [module.vpc.rds_security_group]
  rds_name                 = var.rds_name
}
