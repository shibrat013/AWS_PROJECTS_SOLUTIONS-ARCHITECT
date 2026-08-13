# WordPress on Amazon EC2 – Web and Database Architecture

## Project Overview

This project demonstrates a manual deployment of WordPress on Amazon EC2 using Apache, PHP, and MariaDB.

The lab progressed from a basic WordPress deployment to separating the web and database responsibilities across EC2 instances. It included configuring MariaDB, creating a dedicated WordPress database and user, deploying WordPress, configuring `wp-config.php`, and moving the WordPress database using `mysqldump`.

## Objectives

- Deploy WordPress on Amazon EC2
- Install and configure Apache
- Install PHP and required PHP modules
- Install and configure MariaDB
- Create a dedicated WordPress database and database user
- Configure WordPress database connectivity
- Separate web-server and database responsibilities
- Export and migrate a WordPress database using `mysqldump`
- Configure services to start automatically
- Understand the architecture of a traditional web application

## AWS Services and Technologies

- Amazon EC2
- Amazon EBS
- Apache HTTP Server
- PHP
- MariaDB
- WordPress
- Linux

## Architecture

### Initial Deployment

```text
                 Internet
                    │
                    ▼
              EC2 Instance
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
se HTTPS with AWS Certificate Manager

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
shibratfatemah@Shibrats-MacBook-Air aws-project-cleanup % >....                                       
This project demonstrates a manual deployment of WordPress on Amazon EC2 using Apache, PHP, and MariaDB.

The lab progressed from a basic WordPress deployment to separating the web and database responsibilities across EC2 instances. It included configuring MariaDB, creating a dedicated WordPress database and user, deploying WordPress, configuring `wp-config.php`, and moving the WordPress database using `mysqldump`.

## Objectives

- Deploy WordPress on Amazon EC2
- Install and configure Apache
- Install PHP and required PHP modules
- Install and configure MariaDB
- Create a dedicated WordPress database and database user
- Configure WordPress database connectivity
- Separate web-server and database responsibilities
- Export and migrate a WordPress database using `mysqldump`
- Configure services to start automatically
- Understand the architecture of a traditional web application

## AWS Services and Technologies

- Amazon EC2
- Amazon EBS
- Apache HTTP Server
- PHP
- MariaDB
- WordPress
- Linux

## Architecture

### Initial Deployment

```text
                 Internet
                    │
                    ▼
              EC2 Instance
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
heredoc> 
shibratfatemah@Shibrats-MacBook-Air aws-project-cleanup %
git status

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
heredoc>
heredoc> shibratfatemah@Shibrats-MacBook-Air aws-project-cleanup %
heredoc> git status
heredoc> 
