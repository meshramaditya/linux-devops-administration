# Architecture

# Linux DevOps Administration & Automation on AWS

## Overview

This project is designed around a single **AWS EC2 Ubuntu Server** that simulates a production Linux environment. The server hosts the application, manages Linux users and permissions, runs automation scripts, performs monitoring tasks, and executes scheduled jobs using Cron.

The objective is to demonstrate the responsibilities of a Linux Administrator and DevOps Engineer through practical implementation rather than theoretical concepts.

---

# High-Level Architecture

```text
                    Developer
                        │
                        │ SSH (Port 22)
                        ▼
         ┌────────────────────────────────────┐
         │           AWS EC2 Instance         │
         │        Ubuntu Server 24.04         │
         │                                    │
         │   Linux Administration             │
         │   Users & Groups                   │
         │   Permissions                      │
         │   Shared Directory                 │
         │                                    │
         │   Nginx Web Server                 │
         │                                    │
         │   Bash Automation                  │
         │   Cron Scheduler                   │
         │                                    │
         │   Reports                          │
         │   Logs                             │
         │   Backups                          │
         └────────────────────────────────────┘
```

---

# AWS Infrastructure

## Components

| Component      | Purpose              |
| -------------- | -------------------- |
| AWS EC2        | Virtual Linux Server |
| Ubuntu Server  | Operating System     |
| EBS Volume     | Persistent Storage   |
| Security Group | Network Firewall     |
| SSH            | Secure Remote Access |

---

# AWS Resource Flow

```text
Internet
     │
     ▼
AWS Security Group
     │
     ▼
EC2 Ubuntu Server
     │
     ▼
Nginx Web Server
     │
     ▼
Application Files
```

---

# Linux Directory Architecture

The project follows a structured directory hierarchy.

```text
/company-app
│
├── app
├── logs
├── scripts
├── backups
├── config
├── releases
├── shared
└── tmp
```

---

## Directory Description

### app

Stores application source code and deployment files.

---

### logs

Stores:

* Backup logs
* Health reports
* Monitoring logs
* Alert logs

---

### scripts

Contains automation scripts:

* backup.sh
* health.sh
* app-monitor.sh
* disk-monitor.sh
* user-report.sh

---

### backups

Stores timestamped compressed application backups.

---

### config

Application configuration files.

---

### releases

Stores deployment versions.

---

### shared

Shared directory for developers using SGID.

---

### tmp

Temporary storage.

---

# User Management Architecture

```text
Linux Users

          developers Group
         ┌──────┬──────┬──────┬──────┐
         │      │      │      │
developer1 developer2 developer3 developer4

                 │

             devops Group
                 │
              devops1
```

---

# Permission Architecture

| Directory | Owner   | Group      | Permission |
| --------- | ------- | ---------- | ---------- |
| app       | devops1 | developers | 770        |
| scripts   | devops1 | developers | 775        |
| releases  | devops1 | developers | 775        |
| logs      | devops1 | devops     | 770        |
| backups   | devops1 | devops     | 700        |
| config    | devops1 | devops     | 750        |
| shared    | devops1 | developers | 2775       |
| tmp       | root    | root       | 1777       |

---

# Shared Directory Architecture

The shared directory uses the SGID bit.

```text
developer1
        │
        ▼
Creates File
        │
        ▼
Group Automatically
Becomes developers
        │
        ▼
developer2
Can Access
```

This enables collaborative development without manually changing group ownership.

---

# Application Architecture

```text
Browser
   │
HTTP Request
   │
   ▼
Nginx
   │
Static Files
   │
   ▼
/company-app/app
```

---

# Monitoring Architecture

The server is monitored using Linux utilities.

```text
CPU
Memory
Disk
Processes
Ports
Services
        │
        ▼
Health Script
        │
        ▼
Health Report
```

---

# Backup Architecture

```text
/company-app/app
         │
         ▼
tar.gz Compression
         │
         ▼
Timestamp Added
         │
         ▼
/company-app/backups
```

Older backups are automatically deleted after seven days.

---

# Application Monitoring

```text
Check Nginx
      │
      ▼
Running?
  │         │
 Yes       No
  │         │
 Log     Restart
             │
             ▼
      Verify Service
             │
             ▼
       Log Result
```

---

# Disk Monitoring

```text
Check Disk Usage
        │
        ▼
Usage > 80%
        │
   ┌────┴────┐
   │         │
 No         Yes
   │         │
 Log     Generate Alert
```

---

# Cron Architecture

```text
Cron Scheduler
       │
       ├──────── Backup Script
       │
       ├──────── Health Script
       │
       ├──────── Disk Monitor
       │
       ├──────── Application Monitor
       │
       └──────── User Report
```

---

# Git Workflow Architecture

```text
main
 │
 ▼
develop
 │
 ├──────── feature/login
 │
 ├──────── feature/profile
 │
 └──────── bugfix/header
```

Feature branches are merged into the develop branch before final integration into main.

---

# Logging Architecture

```text
Scripts
   │
   ▼
Generate Logs
   │
   ├── backup.log
   ├── app-monitor.log
   ├── disk-monitor.log
   ├── app-alert.log
   └── Health Reports
```

---

# Troubleshooting Workflow

```text
Problem Reported
       │
       ▼
Collect Information
       │
       ▼
Investigate
       │
       ▼
Identify Root Cause
       │
       ▼
Apply Fix
       │
       ▼
Verify Resolution
       │
       ▼
Document Findings
```

---

# Security Design

The project follows security best practices:

* Principle of Least Privilege
* Role-Based Access Control
* Restricted backup access
* Secure file ownership
* Controlled shared directory access
* Limited user permissions
* Separate developer and DevOps groups

---

# Automation Design

Automation replaces repetitive manual administration.

Automated tasks include:

* Daily backups
* Server health reports
* Disk usage monitoring
* Application monitoring
* User reporting
* Log cleanup

---

# Benefits of the Architecture

* Organized directory structure
* Secure user management
* Automated maintenance
* Improved system reliability
* Faster troubleshooting
* Reduced manual effort
* Easier collaboration
* Production-oriented implementation

---

# Future Improvements

The current architecture can be extended with:

* Docker containers
* Kubernetes
* Jenkins CI/CD
* GitHub Actions
* Terraform
* Ansible
* Prometheus
* Grafana
* Amazon CloudWatch
* AWS SNS notifications
* Amazon S3 backup storage
* Load Balancer
* Auto Scaling Group

---

# Architecture Summary

This architecture demonstrates a practical Linux administration environment running on AWS. It combines secure user management, structured file organization, automated maintenance, monitoring, scheduled operations, and Git-based version control into a single cohesive implementation. The design follows common DevOps practices and provides a strong foundation for future cloud-native and infrastructure automation projects.
