variable "rds_snapshot_id" {
  description = "The snapshot ID to restore the RDS instance from"
  type        = string
  default     = ""
}

variable "rds_sg_id" {
  description = "The ID of the security group to associate with the RDS instance"
  type        = string
  default     = ""
}

variable "rds_instance_type" {
  description = "The type (size) of the RDS instance ex db.t3.micro"
  type        = string
  default     = "db.t3.micro"
}

variable "rds_instance_name" {
  description = "Resource name for the RDS"
  type        = string
  default     = "mysql84"
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

variable "rds_allocated_storage" {
  description = "The allocated storage in gigabytes"
  type        = number
  default     = 20
}

variable "rds_username" {
  description = "Username for the RDS instance"
  type        = string
  default     = "root"
}

variable "rds_password" {
  description = "Password for the RDS instance"
  type        = string
  sensitive   = true
}

variable "rds_storage_type" {
  description = "The storage type for the RDS instance"
  type        = string
  default     = "gp3"
}

variable "rds_backup_retention_period" {
  description = "The backup retention period in days"
  type        = number
  default     = 35
}

variable "rds_backup_window" {
  description = "The daily time range during which automated backups are created"
  type        = string
  default     = "23:00-23:30"
}

variable "rds_maintenance_window" {
  description = "The weekly time range during which system maintenance can occur"
  type        = string
  default     = "Mon:03:00-Mon:05:00"
}

variable "rds_engine_version" {
  description = "The engine version for the RDS instance"
  type        = string
  default     = "8.4.7"
}