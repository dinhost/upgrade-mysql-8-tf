# AWS RDS MySQL Upgrade (8.0 to 8.4)

This Terraform project is designed to facilitate the upgrade of AWS RDS MySQL instances from version 8.0 to 8.4.

## Overview

As MySQL 8.0 approaches its End of Life (EOL), it is critical to migrate databases to a supported Long-Term Support (LTS) version. This project aims to provide a structured, Infrastructure-as-Code (IaC) approach to handle this transition smoothly within AWS.

## Project Status

**Under Development**: We are currently in the process of defining the Terraform configurations and scripts. 

*Detailed usage instructions and migration guides will be added once the base infrastructure code is finalized.*

## Current Structure

- `main.tf`: Core RDS and infrastructure resources.
- `variables.tf`: Configuration inputs for the migration.
- `providers.tf`: AWS and Terraform provider requirements.
- `scripts/`: Helper scripts for pre/post-upgrade tasks.
