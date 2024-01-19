variable "ec2_sg_id" {
  description = "ID of the EC2 Security Group for the RDS Security Group configuration"
  type        = string
}

variable "ec2_snapshot_id" {
  description = "ID of the latest Snapshot from Production EC2 so we can create our Dev Environment"
  type        = string
}

variable "rds_instance_type" {
  description = "The type (size) of the RDS instance ex db.t3.micro"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_instance_name" {
  description = "Resource name for the RDS"
  type        = string
  default     = "my-db-mysql8"
}

variable "rds_adm_user" {
  description = "Username of the RDS Database administrator. (eg root)"
  type        = string
  sensitive   = true
}

variable "rds_adm_pass" {
  description = "Password of the RDS Database administrator"
  type        = string
  sensitive   = true
}

variable "rds_az" {
  description = "Availability Zone for the RDS Instance"
  type        = string
  default     = "us-east-1f"
}

variable "aws_region" {
  description = "Default region of AWS resources in this project"
  type        = string
  default     = "us-east-1"
}