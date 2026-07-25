# SecureGov Cloud

> A secure AWS landing zone demonstrating Infrastructure as Code, cloud security engineering, automated monitoring, and event-driven remediation.

---

## Project Information

| Item | Value |
|------|-------|
| **Author** | John Parente |
| **Status** | Planning |
| **Project Type** | Portfolio Project |
| **Primary Technologies** | AWS, Terraform, GitHub Actions, Python (Lambda) |

---

# Table of Contents

1. [Project Overview](#project-overview)
2. [Project Goals](#project-goals)
3. [Project Scope](#project-scope)
4. [High-Level Architecture](#high-level-architecture)
5. [Security Objectives](#security-objectives)
6. [Automated Remediation](#automated-remediation)
7. [Implementation Roadmap](#implementation-roadmap)
8. [Success Criteria](#success-criteria)
9. [Future Enhancements](#future-enhancements)

---

# Project Overview

## Purpose

SecureGov Cloud is a cloud security engineering project designed to demonstrate the implementation of a secure AWS environment using modern Infrastructure as Code (IaC) practices, automated security monitoring, and event-driven remediation.

The project simulates migrating a small enterprise or government web application into AWS while implementing cloud security best practices throughout the deployment.

Rather than focusing solely on deploying infrastructure, the project emphasizes:

- Secure architecture
- Least-privilege access
- Infrastructure as Code
- Threat detection
- Compliance monitoring
- Automated remediation
- Operational visibility

The environment will be built incrementally using Terraform and managed as though it were a production enterprise environment.

---

# Project Goals

## Infrastructure

- Deploy AWS infrastructure entirely with Terraform
- Build a production-style VPC
- Implement a secure multi-tier architecture
- Eliminate manual infrastructure provisioning

## Security

- Implement least-privilege IAM
- Encrypt resources using AWS KMS
- Store credentials in AWS Secrets Manager
- Restrict network traffic using Security Groups
- Prevent public exposure of sensitive resources

## Monitoring

- Enable CloudTrail
- Configure CloudWatch
- Enable GuardDuty
- Enable AWS Config
- Aggregate findings in Security Hub

## Automation

- Detect insecure configurations
- Automatically remediate selected findings
- Notify administrators using Amazon SNS
- Demonstrate event-driven security automation

## Documentation

- Produce architecture diagrams
- Document security decisions
- Maintain deployment documentation
- Create a threat model

---

# Project Scope

## In Scope

### Networking

- Amazon VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups
- Network ACLs

### Compute

- Amazon EC2
- Auto Scaling Group
- Application Load Balancer

### Storage

- Amazon S3

### Database

- Amazon RDS PostgreSQL

### Security

- IAM Roles
- AWS KMS
- AWS Secrets Manager
- AWS WAF
- Amazon GuardDuty
- AWS Config
- AWS Security Hub
- IAM Access Analyzer
- Amazon Inspector

### Monitoring

- Amazon CloudWatch
- AWS CloudTrail
- Amazon SNS

### Automation

- Amazon EventBridge
- AWS Lambda

### Infrastructure

- Terraform
- GitHub Actions

---

# High-Level Architecture

The environment will follow a secure multi-tier architecture.

```
Internet
    │
Route 53
    │
CloudFront
    │
AWS WAF
    │
Application Load Balancer
    │
──────────────────────────────
      Public Subnets
──────────────────────────────
        NAT Gateway
──────────────────────────────
      Private Subnets
──────────────────────────────
Application EC2 Instances
        │
 Secrets Manager
        │
 Amazon RDS PostgreSQL
```

Security monitoring services operate independently of the application stack:

- CloudTrail
- CloudWatch
- GuardDuty
- AWS Config
- Security Hub
- Inspector
- IAM Access Analyzer

Security findings trigger EventBridge rules that invoke Lambda functions to perform automated remediation and notify administrators using Amazon SNS.

---

# Security Objectives

## Least Privilege

- IAM Roles instead of IAM Users
- Minimize permissions wherever possible
- Follow AWS security best practices

## Defense in Depth

Multiple layers of protection will be implemented:

- Network segmentation
- Security Groups
- Encryption
- Logging
- Threat detection
- Automated remediation

## Encryption

- Encrypt supported services using AWS KMS
- Store credentials in AWS Secrets Manager
- Prevent plaintext secrets in code

## Monitoring

- CloudTrail records API activity
- CloudWatch monitors infrastructure health
- GuardDuty detects threats
- AWS Config monitors compliance
- Security Hub aggregates findings

---

# Automated Remediation

The environment will automatically detect and remediate selected security issues.

Examples include:

- Public S3 bucket detected
- Security Group allowing SSH (22) from 0.0.0.0/0
- Unencrypted storage resources
- Non-compliant resource configurations

Workflow:

1. AWS Config or Security Hub identifies a finding.
2. EventBridge captures the event.
3. Lambda performs remediation.
4. CloudWatch logs the action.
5. SNS sends a notification.

---

# Implementation Roadmap

## Phase 1

- Terraform setup
- Networking
- IAM
- EC2

## Phase 2

- Application Load Balancer
- Auto Scaling
- Amazon RDS
- Secrets Manager
- AWS KMS

## Phase 3

- CloudTrail
- CloudWatch
- GuardDuty
- AWS Config
- Security Hub
- Amazon Inspector

## Phase 4

- EventBridge
- AWS Lambda
- Amazon SNS
- Automated remediation

## Phase 5

- GitHub Actions
- Terraform validation
- Automated deployment

## Phase 6

- Architecture diagrams
- Threat model
- Documentation
- Project polish

---

# Success Criteria

The project will be considered complete when:

- Infrastructure is fully deployable using Terraform.
- Security services are configured and operational.
- Automated remediation successfully resolves at least two security findings.
- Logging and monitoring provide complete operational visibility.
- Documentation is complete and professional.
- The repository is suitable for technical interviews and portfolio presentation.

---

# Future Enhancements

Potential future improvements include:

- Amazon ECS/Fargate
- Amazon EKS
- AWS Organizations
- Centralized logging account
- Amazon Macie
- AWS Detective
- SIEM integration
- CIS AWS Foundations Benchmark reporting
- Terratest integration
