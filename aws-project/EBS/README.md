# Amazon EBS – Persistent Block Storage with EC2

## Project Overview

This project demonstrates Amazon Elastic Block Store (EBS) with Amazon EC2. The lab covered creating and attaching an EBS volume, formatting it with XFS, mounting it to an EC2 instance, storing data, configuring persistent mounting, and working with the volume from additional EC2 instances.

The lab also included additional EBS volume and snapshot exercises.

## Objectives

- Identify attached block devices on an EC2 instance
- Inspect an EBS volume
- Format an EBS volume using XFS
- Mount an EBS volume to a directory
- Store and verify data on the volume
- Configure persistent mounting using `/etc/fstab`
- Identify a filesystem using its UUID
- Verify EBS data persistence after an EC2 reboot
- Understand how an EBS volume can be detached and used with another EC2 instance
- Explore EBS snapshot and volume workflows

## AWS Services Used

- Amazon EC2
- Amazon EBS

## Architecture

```text
                    Amazon EC2
                        │
                        │
                 Amazon EBS Volume
                        │
                        ▼
                    /ebstest
                        │
                        ▼
              amazingtestfile.txt

Then **only run**:

```bash
git status
