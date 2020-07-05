resource "aws_db_instance" "application" {
  allocated_storage       = "${var.db_storage}"
  max_allocated_storage   = "${var.db_maxstorage}"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = "${var.dbinstance_clas}"
  name                    = "Application RDS Instance"
  username                =  "${var.dbuser}"
  password                = "${var.dbpassword}"
  parameter_group_name    = "default.mysql5.7"
  db_subnet_group_name    = "${var.dbsubnet}"
  multi_az                = true
  storage_encrypted       = true
  vpc_security_group_ids  = "${var.rds_security_group}"
  tags = {
    Name = var.rds_name
  }
}

