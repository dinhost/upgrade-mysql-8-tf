data "aws_vpc" "default" {
  default = true
}

resource "aws_db_instance" "mysql84" {
  allocated_storage       = var.rds_allocated_storage
  identifier              = var.rds_instance_name
  snapshot_identifier     = var.rds_snapshot_id

  engine                  = "mysql"
  engine_version          = var.rds_engine_version
  allow_major_version_upgrade = true
  instance_class          = var.rds_instance_type
  username                = var.rds_username
  password                = var.rds_password
  skip_final_snapshot     = true
  storage_type            = var.rds_storage_type
  backup_retention_period = var.rds_backup_retention_period
  backup_window           = var.rds_backup_window
  maintenance_window      = var.rds_maintenance_window
  deletion_protection     = true
  availability_zone       = var.rds_az
  vpc_security_group_ids  = [
    var.rds_sg_id
  ]
}