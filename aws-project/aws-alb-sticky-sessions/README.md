# AWS Application Load Balancer – Sticky Sessions

## 📌 Project Overview

This project demonstrates how an AWS Application Load Balancer (ALB) distributes HTTP traffic across multiple EC2 instances and how cookie-based sticky sessions affect request routing.

I deployed six EC2 instances behind an Application Load Balancer and configured an EC2 Target Group with ALB-generated cookie stickiness.

The purpose of the project was to gain practical experience with load balancing, target groups, health checks, EC2 instances, and session persistence.

---

## 🎯 Objectives

- Deploy multiple EC2 web servers
- Configure an Application Load Balancer
- Create an EC2 Target Group
- Register multiple EC2 instances as targets
- Verify target health
- Enable cookie-based sticky sessions
- Test session persistence through the ALB
- Understand how session affinity affects traffic routing

---

## 🏗️ Architecture

```text
                         Internet
                            │
                            ▼
                ┌─────────────────────┐
                │ Application Load    │
                │ Balancer (ALB)      │
                └──────────┬──────────┘
                           │
                    EC2 Target Group
                           │
        ┌──────────────────┼──────────────────┐
        │                  │                  │
        ▼                  ▼                  ▼
     EC2 #1             EC2 #2             EC2 #3
        │                  │                  │
        ├──────────────────┼──────────────────┤
        │                  │                  │
        ▼                  ▼                  ▼
     EC2 #4             EC2 #5             EC2 #6