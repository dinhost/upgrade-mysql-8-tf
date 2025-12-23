# AWS RDS MySQL Upgrade (8.0 to 8.4)

This Terraform project is designed to facilitate the upgrade of AWS RDS MySQL instances from version 8.0 to 8.4.

## Overview

As MySQL 8.0 approaches its End of Life (EOL), it is critical to migrate databases to a supported Long-Term Support (LTS) version. This project aims to provide a structured, Infrastructure-as-Code (IaC) approach to handle this transition smoothly within AWS.

## Usage

### 1. Configure AWS Credentials
Ensure you have configured your AWS credentials in your environment. You can do this by:
- Setting environment variables (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
- Using a configuration file (usually located at `~/.aws/credentials`).
- Using an AWS profile.

### 2. Create a `.tfvars` file
Create a custom `.tfvars` file to specify your configuration. For example, create a file named `mycustomer.env.tfvars`:

```hcl
rds_snapshot_id      = "arn:aws:rds:us-east-1:123456789012:snapshot:my-snapshot"
rds_sg_id           = "sg-xxxxxxxxxxxxxxxxx"
rds_instance_type    = "db.t4g.micro"
rds_az               = "us-east-1a"
rds_allocated_storage = 20
rds_username         = "admin"
rds_password         = "your-secure-password"
```

### 3. Run Terraform
Execute the following command to apply the changes, specifying your AWS profile and the variables file:

```bash
AWS_PROFILE=mycustomer terraform apply -auto-approve -var-file=mycustomer.env.tfvars
```

## Current Structure

- `main.tf`: Core RDS and infrastructure resources.
- `variables.tf`: Configuration inputs for the migration.
- `providers.tf`: AWS and Terraform provider requirements.
- `*.env.tfvars`: Environment-specific variable files.
