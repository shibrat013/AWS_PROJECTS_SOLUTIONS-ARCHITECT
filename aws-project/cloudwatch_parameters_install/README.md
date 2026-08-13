# CloudWatch Monitoring and Systems Manager Parameter Store

## Project Overview

This project demonstrates how to configure Amazon CloudWatch monitoring for an Amazon EC2 instance using the CloudWatch Agent and AWS Systems Manager Parameter Store.

The CloudWatch Agent was configured to collect system metrics and application logs from an EC2 instance. The agent configuration was stored in Systems Manager Parameter Store and retrieved by the EC2 instance when the agent was started.

## Objectives

- Install the Amazon CloudWatch Agent on EC2
- Configure an IAM role for the CloudWatch Agent
- Use Systems Manager Parameter Store to store the CloudWatch Agent configuration
- Collect EC2 system metrics
- Collect Linux security logs
- Collect Apache access logs
- Collect Apache error logs
- Retrieve the configuration from SSM Parameter Store
- Start the CloudWatch Agent using the retrieved configuration

## AWS Services Used

- Amazon EC2
- Amazon CloudWatch
- Amazon CloudWatch Agent
- AWS Systems Manager Parameter Store
- AWS IAM

## Architecture

```text
                    Amazon EC2
                        │
             CloudWatch Agent
                        │
          ┌─────────────┴─────────────┐
          │                           │
      System Metrics              Log Files
          │                           │
          └─────────────┬─────────────┘
                        │
                        ▼
                   CloudWatch

        SSM Parameter Store
                │
                │ Configuration
                ▼
          CloudWatch Agent
```

## IAM Configuration

An IAM role was created for the EC2 instance with permissions required by the CloudWatch Agent and Systems Manager.

The lab used:

- `CloudWatchAgentServerPolicy`
- `AmazonSSMFullAccess`

The role was attached to the EC2 instance.

## Implementation

### 1. Install the CloudWatch Agent

The CloudWatch Agent was installed on the EC2 instance:

```bash
sudo dnf install amazon-cloudwatch-agent
```

### 2. Configure the CloudWatch Agent

The CloudWatch Agent configuration wizard was started:

```bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
```

The configuration was created to collect system metrics and application/security logs.

### 3. Log Collection

The following logs were configured for collection:

```text
/var/log/secure
/var/log/httpd/access_log
/var/log/httpd/error_log
```

This provides visibility into Linux security events and Apache web-server activity.

### 4. Store the Configuration in Parameter Store

The CloudWatch Agent configuration was stored in AWS Systems Manager Parameter Store using the parameter name:

```text
AmazonCloudWatch-linux
```

The local configuration is stored at:

```text
/opt/aws/amazon-cloudwatch-agent/bin/config.json
```

The SSM parameter allows the configuration to be retrieved by the EC2 instance rather than requiring the configuration to be manually recreated on the server.

### 5. Prepare the EC2 Instance

The following directories/files were created as part of the lab troubleshooting:

```bash
sudo mkdir -p /usr/share/collectd/
sudo touch /usr/share/collectd/types.db
```

### 6. Retrieve the Configuration and Start the Agent

The CloudWatch Agent was configured to retrieve its configuration from Parameter Store and start:

```bash
sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c ssm:AmazonCloudWatch-linux -s
```

## 🧠 What I Learned

- IAM roles allow EC2 applications to access AWS services without storing long-term credentials on the instance.
- The CloudWatch Agent can collect metrics beyond the default EC2 monitoring data.
- CloudWatch can centralize application and operating-system logs.
- Systems Manager Parameter Store can be used to centrally store configuration data.
- The CloudWatch Agent can retrieve its configuration from Parameter Store.
- Apache access and error logs can be monitored centrally through CloudWatch.

## Security Note

The lab used IAM permissions to allow the EC2 instance to communicate with AWS services. In a production environment, IAM policies should follow the principle of least privilege rather than granting broad permissions such as `AmazonSSMFullAccess` unless required.

No passwords, access keys, or other credentials should be stored in this repository.

## 📸 Screenshots

Screenshots from the lab are stored in the `screenshot` directory.

## Possible Extensions

Future improvements could include:

- Create a least-privilege IAM policy
- Configure CloudWatch alarms
- Create dashboards
- Monitor CPU, memory, disk, and network metrics
- Configure log retention
- Use Systems Manager Session Manager
- Automate the CloudWatch Agent configuration with CloudFormation

## Learning Context

This project was completed as part of my hands-on preparation for the AWS Certified Solutions Architect – Associate certification.
