# Lambda – Start and Stop EC2 Instances

## Overview

This project demonstrates how AWS Lambda can be used to start and stop Amazon EC2 instances programmatically.

Instead of keeping a server running to perform these actions, Lambda executes the required AWS API calls on demand.

## Architecture

```text
AWS Lambda
   |
   | boto3
   v
Amazon EC2
   |
   +--> Start instances
   |
   +--> Stop instances