# WordPress on Amazon EC2

## Project Overview

This project demonstrates a manual deployment of a WordPress website on an Amazon EC2 instance using Apache, PHP, and MariaDB.

The lab focused on installing the web and database components, configuring MariaDB, deploying WordPress, and connecting the application to the database.

## Objectives

- Deploy a WordPress application on EC2
- Install and configure Apache
- Install PHP and required PHP modules
- Install and configure MariaDB
- Create a database and database user for WordPress
- Configure WordPress to communicate with MariaDB
- Understand the basic components of a traditional web application stack

## AWS Services and Technologies

- Amazon EC2
- Amazon EBS
- Apache HTTP Server
- PHP
- MariaDB
- WordPress

## Architecture

```text
                 Internet
                    │
                    ▼
             EC2 Web Server
                    │
          ┌─────────┴─────────┐
          │                   │
       Apache               PHP
          │                   │
          └─────────┬─────────┘
                    │
                    ▼
                WordPress
                    │
                    ▼
                 MariaDB
```

## Implementation

### 1. EC2 Instance

An EC2 instance was used as the compute environment for the WordPress application.

### 2. Install Web and Database Software

The required software packages were installed on the EC2 instance, including Apache, PHP, PHP database modules, and MariaDB.

Example packages included:

```text
httpd
php
php-mysqlnd
php-mysqli
mariadb105-server
```

### 3. Configure MariaDB

MariaDB was configured as the database backend for WordPress.

A dedicated database and database user were created for the WordPress installation.

Database credentials are intentionally represented by placeholders in this repository. Real passwords should never be committed to GitHub.

### 4. Configure Apache and PHP

Apache was used as the web server and PHP provided the runtime required by WordPress.

The required PHP modules were installed so that WordPress could communicate with MariaDB.

### 5. Deploy WordPress

WordPress was downloaded and configured on the EC2 instance.

The WordPress configuration was connected to the MariaDB database created for the application.

### 6. Application Architecture

The resulting application used a traditional three-layer-style web stack:

```text
Browser
   │
   ▼
Apache
   │
   ▼
PHP / WordPress
   │
   ▼
MariaDB
```

## 🧠 What I Learned

- EC2 can host a complete web application stack.
- Apache can serve web traffic for WordPress.
- PHP provides the application runtime required by WordPress.
- MariaDB provides relational database storage for WordPress.
- The web application and database have different responsibilities.
- Application configuration must contain the correct database connection information.
- Credentials should be managed securely and never committed to source control.

## Security Considerations

- Database passwords are not stored in this repository.
- Production environments should use least-privilege database accounts.
- AWS security groups should expose only the required ports.
- Database access should be restricted to trusted application sources.
- Secrets should be stored using an appropriate secrets-management solution rather than hard-coded in application files.

## 📸 Screenshots

Screenshots from the lab are stored in the `Screenshots` directory.

## Possible Improvements

Future improvements could include:

- Move the database from the EC2 instance to Amazon RDS
- Place the application behind an Application Load Balancer
- Use Auto Scaling for multiple WordPress instances
- Store static assets in Amazon S3
- Use AWS Secrets Manager or Systems Manager Parameter Store for secrets
- Add CloudWatch monitoring and alarms
- Use HTTPS with AWS Certificate Manager

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
