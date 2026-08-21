# WordPress High Availability with EFS, RDS, ALB and Auto Scaling

## Project Overview

This project demonstrates the evolution of a WordPress workload from a single EC2 instance into a scalable and highly available AWS architecture.

The final design uses Amazon RDS for the WordPress database, Amazon EFS for shared WordPress content, an Application Load Balancer for traffic distribution, and an EC2 Auto Scaling Group for elasticity.

## AWS Services Used

- Amazon EC2
- Amazon EFS
- Amazon RDS
- Application Load Balancer
- EC2 Auto Scaling
- Amazon VPC
- AWS Systems Manager Parameter Store
- WordPress
- Apache
- PHP

## Final Architecture

```text
Internet
   |
   v
Application Load Balancer
   |
Target Group
   |
EC2 WordPress instances
   |
   +--> Amazon EFS
   |
   +--> Amazon RDS MySQL
   |
EC2 Auto Scaling Group
```

## Implementation

### 1. EFS Shared Storage

Amazon EFS was configured as shared storage for the WordPress wp-content directory so multiple EC2 instances can access the same content.

### 2. Amazon RDS

The WordPress database was separated from the EC2 application server and migrated to Amazon RDS MySQL.

### 3. Launch Template

The EC2 Launch Template was configured to create WordPress application instances consistently.

### 4. Application Load Balancer

An Application Load Balancer was placed in front of the WordPress instances and connected to a target group.

### 5. Auto Scaling Group

An EC2 Auto Scaling Group was configured to maintain the desired number of WordPress instances and register healthy instances with the load balancer.

### 6. WordPress Configuration

WordPress was configured to work behind the load balancer and use shared EFS storage rather than relying on a single EC2 instance.

## Result

The final architecture separates the application, storage, and database tiers and provides a foundation for horizontal scaling and improved availability.

## What I Learned

- Shared storage is required when scaling stateful applications horizontally.
- EFS provides shared file storage across EC2 instances.
- RDS separates the database tier from the application tier.
- An Application Load Balancer distributes traffic across healthy instances.
- Auto Scaling maintains EC2 capacity.
- WordPress should not depend on a single EC2 public IP.

## Screenshots

Implementation evidence is stored in the Screenshots directory.

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
