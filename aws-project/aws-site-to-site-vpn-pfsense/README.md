# AWS Site-to-Site VPN with pfSense Plus

## Overview

This hands-on networking lab connects an AWS VPC to a simulated on-premises network using **pfSense Plus** and **AWS Site-to-Site VPN**. The exercise focuses on IPsec tunnel configuration, routing, and end-to-end connectivity validation.

## Architecture

- **AWS:** VPC, EC2 test instance, AWS Site-to-Site VPN, and two VPN tunnel endpoints.
- **Firewall:** pfSense Plus configured as the customer-gateway-side VPN appliance.
- **Test client:** Windows EC2 instance in the simulated remote network.
- **VPN protocol:** IPsec / IKEv1 as shown in the lab configuration.
- **Resilience concept:** Two AWS VPN tunnels are configured and checked independently.

> This is a learning lab, not a production-ready reference architecture. Production deployments should review current AWS and Netgate security recommendations, use modern cryptographic settings, and follow least-privilege network rules.

## What I configured

1. Set up the pfSense Plus appliance and accessed its web interface.
2. Configured IPsec Phase 1 entries for the two AWS VPN tunnel endpoints.
3. Applied the IPsec configuration in pfSense.
4. Checked **Status → IPsec → Overview** to confirm both tunnels reached the **Established** state.
5. Tested connectivity from a Windows test instance to an AWS private IP using `ping`.

## Validation

The lab screenshots captured these results:

- Both IPsec connections showed **Established** in the pfSense IPsec status page.
- A Windows test instance successfully pinged a private address in the lab network: **4 packets sent, 4 received, 0% packet loss**.

Successful ping tests demonstrate reachability for that specific test path; they do not by themselves prove every route, security-group rule, or failover scenario is correct.

## Key concepts practised

- AWS Site-to-Site VPN and customer gateways
- IPsec tunnels and IKE Phase 1
- Redundant VPN tunnel endpoints
- Private IP connectivity across network boundaries
- Routing and network troubleshooting
- Validating connectivity with ping and tunnel status
- Cost awareness when running Marketplace appliances and AWS networking resources

## Cost and cleanup

The pfSense Marketplace software charge may be separate from EC2, EBS, public IPv4, VPN connection, data-transfer, and tax charges. Pricing and trial eligibility can change, so check the current offer before deploying.

After the lab, verify which resources were created and remove the resources you no longer need, including the EC2 appliance/test instances, Site-to-Site VPN connection, Customer Gateway, Virtual Private Gateway or Transit Gateway resources, and any unattached EBS volumes or allocated public IPv4 addresses. Check Billing and Cost Management afterwards.

## Screenshots

Add sanitized screenshots to a `screenshots/` folder and link them here. Before committing screenshots, crop or blur account IDs, public IP addresses, instance IDs, browser tabs, and any other identifying or sensitive details.

Suggested screenshots:
- `screenshots/pfsense-ipsec-tunnels.png` — configured tunnel entries
- `screenshots/pfsense-ipsec-established.png` — both tunnels established
- `screenshots/windows-ping-success.png` — connectivity test result

## Security notes

- Do not commit VPN pre-shared keys, private keys, passwords, AWS access keys, or exported configuration files containing secrets.
- Use placeholders for secrets in any future configuration examples.
- Restrict the pfSense management interface and Windows RDP access to trusted source IPs; do not expose management ports to the entire internet.

## Learning context

Completed as a practical AWS networking exercise while preparing for the AWS Certified Solutions Architect – Associate certification, using a guided training lab and independently validating tunnel status and private-network connectivity.
