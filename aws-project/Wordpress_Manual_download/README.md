# WordPress on Amazon EC2 – Web and Database Architecture

## Project Overview

This project demonstrates a manual deployment of WordPress on Amazon EC2 using Apache, PHP, and MariaDB.

The lab progressed from a basic WordPress deployment to separating the web-server and database responsibilities across EC2 instances. It also included database migration using `mysqldump` and configuration of WordPress to connect to the database server.

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

## Initial Architecture

The initial deployment used a single EC2 instance running the web server, PHP, WordPress, and MariaDB.

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