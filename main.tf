data "aws_vpc" "default" {
  default = true
}

module "rds_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name = "${var.rds_instance_name}_sg"

  vpc_id = data.aws_vpc.default.id

  ingress_with_source_security_group_id = [
    {
      rule                     = "mysql-tcp"
      source_security_group_id = var.ec2_sg_id
    }
  ]

  egress_rules       = ["all-all"]
  egress_cidr_blocks = ["0.0.0.0/0"]

}

resource "aws_db_instance" "mysql8" {
  allocated_storage       = 20
  identifier              = var.rds_instance_name
  engine                  = "mysql"
  engine_version          = "8.0.35"
  instance_class          = var.rds_instance_type
  username                = var.rds_adm_user
  password                = var.rds_adm_pass
  skip_final_snapshot     = true
  storage_type            = "gp3"
  backup_retention_period = 35
  backup_window           = "23:00-23:30"
  maintenance_window      = "Mon:03:00-Mon:05:00"
  deletion_protection     = true
  availability_zone       = var.rds_az
  vpc_security_group_ids  = [
    module.rds_sg.security_group_id
  ]
}

resource "aws_ami" "snapshot-ami" {
  name                = "terraform-example"
  virtualization_type = "hvm"
  root_device_name    = "/dev/sda1"
  ena_support         = true

  ebs_block_device {
    device_name = "/dev/sda1"
    snapshot_id = var.ec2_snapshot_id
  }
}

resource "aws_instance" "ec2-instance" {
  ami                    = aws_ami.snapshot-ami.id
  instance_type          = "t3a.micro"
  availability_zone      = var.rds_az
  vpc_security_group_ids = [var.ec2_sg_id]

  user_data = <<EOF
#!/bin/bash
cd /root
git clone https://github.com/dinhost/upgrade-mysql-8-tf.git
EOF

  tags = {
    Name        = "mysql-8-test-instance"
    Terraform   = "true"
    Environment = "dev"
  }
}

#module "ec2-instance" {
#  source  = "terraform-aws-modules/ec2-instance/aws"
#  version = "5.6.0"
#
#  name = "mysql-8-test-instance"
#
#  ami                    = aws_ami.snapshot-ami.id
#  instance_type          = "t3a.micro"
#  availability_zone      = var.rds_az
#  monitoring             = false
#  vpc_security_group_ids = [var.ec2_sg_id]
#
#  user_data = <<EOF
##!/bin/bash
#cd /root
#git clone https://github.com/dinhost/upgrade-mysql-8-tf.git
#EOF
#
#  tags = {
#    Terraform   = "true"
#    Environment = "dev"
#  }
#}