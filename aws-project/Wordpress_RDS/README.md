# AWS WordPress — RDS Migration

## Overview

This project documents the migration of a WordPress application from a local MariaDB database on an EC2 instance to Amazon RDS MySQL.

## Architecture

- Amazon EC2 — WordPress application
- Amazon RDS — MySQL database
- Amazon EFS — shared WordPress storage
- AWS Systems Manager Parameter Store — configuration values
- Launch Template — automated EC2 configuration

## Implementation

1. Created an RDS DB subnet group using the database subnets.
2. Created the `a4lWordPress` RDS MySQL database.
3. Exported the WordPress database from the EC2 instance.
4. Restored the database into RDS.
5. Updated the WordPress configuration to use the RDS endpoint.
6. Updated the RDS endpoint in AWS Systems Manager Parameter Store.
7. Stopped and disabled the local MariaDB service.
8. Verified that WordPress continued working using RDS.
9. Created Launch Template version 2 without local MariaDB installation.
10. Set Launch Template version 2 as the default.

## Key Result

WordPress no longer depends on the local MariaDB database running on the EC2 instance. The database has been separated into Amazon RDS.

## Evidence

Screenshots documenting the implementation are available in the `Screenshots` directory.
