# Amazon EBS – Persistent Block Storage with EC2

## Project Overview

This project demonstrates how to use an Amazon Elastic Block Store (EBS) volume with an Amazon EC2 instance. The lab focused on attaching an EBS volume, formatting it with XFS, mounting it, storing data, and configuring the mount to persist after a reboot.

## Objectives

- Identify attached block devices
- Inspect an EBS volume
- Format an EBS volume using XFS
- Mount an EBS volume to a directory
- Store data on the volume
- Verify data persistence after an EC2 reboot
- Configure persistent mounting using /etc/fstab
- Identify an EBS volume using its UUID

## AWS Services Used

- Amazon EC2
- Amazon EBS

## Implementation

### 1. Identify the EBS Volume

```bash
lsblk
sudo file -s /dev/nvme1n1
```

### 2. Create an XFS Filesystem

```bash
sudo mkfs -t xfs /dev/nvme1n1
```

### 3. Mount the Volume

```bash
sudo mkdir /ebstest
sudo mount /dev/nvme1n1 /ebstest
cd /ebstest
```

A test file was created on the EBS volume to verify that data could be stored.

### 4. Test Persistence After Reboot

The EC2 instance was rebooted and the filesystem and UUID were checked.

```bash
sudo reboot
df -k
sudo blkid
```

The volume was configured in /etc/fstab using its UUID:

```text
UUID=YOUR_UUID_HERE /ebstest xfs defaults,nofail
```

The configuration was tested with:

```bash
sudo mount -a
```

## Test Result

The lab demonstrated that an EBS volume provides persistent block storage that can remain available independently of an EC2 instance reboot when correctly configured and mounted.

## What I Learned

- EBS provides persistent block-level storage for EC2.
- An attached EBS volume is not automatically mounted.
- A filesystem such as XFS must be created before normal use.
- A mount point makes the filesystem accessible to the operating system.
- /etc/fstab can configure automatic mounting.
- Filesystem UUIDs provide a persistent way to identify the filesystem.

## Screenshots

Screenshots from the lab are stored in the AWS_screenshot directory.

## Possible Extensions

- EBS snapshots
- Restoring volumes from snapshots
- EBS encryption with AWS KMS
- Comparing EBS volume types
- Increasing EBS volume size
- Monitoring EBS with CloudWatch

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
