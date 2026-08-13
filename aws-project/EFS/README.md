# Amazon EFS – Shared File Storage for EC2 and WordPress

## Project Overview

This project demonstrates the use of Amazon Elastic File System (EFS) with Amazon EC2. The lab included installing the Amazon EFS utilities, preparing an EFS mount point, and using EFS as shared file storage for a WordPress workload.

EFS provides managed, elastic file storage that can be accessed by multiple EC2 instances within the configured VPC.

## Objectives

- Create and use an Amazon EFS filesystem
- Configure EC2 networking for EFS access
- Install the Amazon EFS utilities
- Mount an EFS filesystem on an EC2 instance
- Use EFS for WordPress file storage
- Understand the difference between EBS block storage and EFS file storage

## AWS Services Used

- Amazon EC2
- Amazon EFS
- Amazon VPC
- WordPress

## Architecture

```text
                 Amazon VPC
                     │
          ┌──────────┴──────────┐
          │                     │
       EC2 Instance A       EC2 Instance B
          │                     │
          └──────────┬──────────┘
                     │
                     ▼
               Amazon EFS
                     │
                     ▼
              /efs/wp-content
```

## Implementation

### 1. Prepare the EC2 Instance

The EC2 instance was prepared for EFS access by installing the Amazon EFS utilities:

```bash
sudo dnf -y install amazon-efs-utils
```

A mount directory was created for the WordPress content:

```bash
sudo mkdir -p /efs/wp-content
```

### 2. Configure EFS Network Access

An EFS filesystem requires appropriate network connectivity through mount targets in the VPC. The EC2 instance and EFS mount target were configured within the AWS networking environment so the instance could access the filesystem.

### 3. Mount EFS

The EFS filesystem was mounted on the EC2 instance using the Amazon EFS utilities.

The WordPress content mount point used during the lab was:

```text
/efs/wp-content
```

### 4. WordPress Integration

EFS was used as shared file storage for WordPress content. This provides a storage layer that can be accessed by multiple EC2 instances rather than keeping the application files only on a single instance.

## 🧠 What I Learned

- EFS is managed network file storage for AWS workloads.
- Unlike EBS, EFS can provide shared filesystem access to multiple EC2 instances.
- EFS access depends on VPC networking and EFS mount targets.
- The `amazon-efs-utils` package provides tools for mounting EFS from Linux.
- EFS can be useful for shared application content in horizontally scaled architectures.
- WordPress can use shared storage for application content when multiple web servers need access to the same files.

## EBS vs EFS

| EBS | EFS |
|---|---|
| Block storage | File storage |
| Typically associated with an EC2 instance | Designed for shared access |
| Mounted as a block device/filesystem | Mounted as a network filesystem |
| Useful for instance-level persistent storage | Useful for shared application files |

## 📸 Screenshots

The `screenshots` directory contains evidence from the EFS implementation.

## Possible Extensions

- Configure EFS encryption
- Configure EFS lifecycle policies
- Test simultaneous access from multiple EC2 instances
- Place multiple WordPress web servers behind an Application Load Balancer
- Combine EFS with an Auto Scaling Group
- Monitor EFS with CloudWatch

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
