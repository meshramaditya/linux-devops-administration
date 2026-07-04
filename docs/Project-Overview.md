# Project Overview

## Linux DevOps Administration & Automation on AWS

## Overview

The **Linux DevOps Administration & Automation on AWS** project is a hands-on implementation of essential Linux system administration, troubleshooting, Git workflow management, Bash automation, and Cron-based task scheduling in a cloud environment. The project was developed on an **AWS EC2 Ubuntu Server** to simulate real-world DevOps operations and demonstrate practical skills required for production infrastructure management.

This project focuses on building a secure Linux environment, implementing role-based access control, automating repetitive administrative tasks, monitoring system health, troubleshooting common production issues, and managing source code using Git and GitHub.

Unlike a theoretical lab, this project follows production-oriented practices where each task is implemented, verified, documented, and tested.

---

# Project Objectives

The primary objectives of this project are:

* Build a secure Linux server on AWS.
* Implement Linux user and group management.
* Configure file ownership and permissions following the Principle of Least Privilege.
* Create shared collaboration directories using SGID.
* Monitor server health and resource utilization.
* Troubleshoot common Linux production issues.
* Implement a professional Git branching workflow.
* Automate administrative tasks using Bash scripting.
* Schedule automated jobs using Cron.
* Generate operational reports and logs.
* Document every implementation for future reference and knowledge sharing.

---

# Technologies Used

| Category           | Technology                       |
| ------------------ | -------------------------------- |
| Cloud Platform     | AWS EC2                          |
| Operating System   | Ubuntu Server 24.04 LTS          |
| Shell              | Bash                             |
| Version Control    | Git                              |
| Repository Hosting | GitHub                           |
| Web Server         | Nginx                            |
| Monitoring         | top, htop, ps, free, df, du, ss  |
| Scheduling         | Cron                             |
| Text Editor        | Nano / Vim                       |
| Networking         | SSH                              |
| Linux Utilities    | systemctl, journalctl, tar, find |

---

# Project Features

This project includes the following major implementations:

### Linux Administration

* Linux directory structure
* User management
* Group management
* File ownership
* File permissions
* Shared directories
* SGID configuration

### Linux Troubleshooting

* Permission denied investigation
* Disk usage analysis
* Performance troubleshooting
* Service recovery
* Application availability troubleshooting

### Git

* Repository initialization
* Git branching strategy
* Feature branches
* Bugfix branches
* Merge conflict resolution
* Git recovery scenarios

### Bash Automation

* Automated backups
* Server health reporting
* Application monitoring
* Disk usage monitoring
* User reporting

### Cron Automation

* Automated backups
* Health monitoring
* Disk monitoring
* User report generation
* Log cleanup
* Application self-healing

---

# Project Workflow

```text
AWS EC2 Ubuntu
        │
        ▼
Linux Administration
        │
        ▼
Users • Groups • Permissions
        │
        ▼
Linux Troubleshooting
        │
        ▼
Git Workflow
        │
        ▼
Bash Automation
        │
        ▼
Cron Scheduling
        │
        ▼
Monitoring & Reporting
```

---

# Project Directory Structure

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

Each directory serves a specific purpose:

| Directory | Purpose                        |
| --------- | ------------------------------ |
| app       | Application source files       |
| logs      | System and application logs    |
| scripts   | Bash automation scripts        |
| backups   | Compressed application backups |
| config    | Configuration files            |
| releases  | Versioned application releases |
| shared    | Shared collaboration directory |
| tmp       | Temporary files                |

---

# Implementation Phases

## Phase 1 – Linux Administration

* AWS EC2 setup
* Linux directory creation
* User creation
* Group management
* Ownership configuration
* Permission management
* Shared directory configuration
* Server health reporting

---

## Phase 2 – Linux Troubleshooting

Production scenarios implemented:

* Permission denied
* Disk full investigation
* High CPU/Memory utilization
* Service failure recovery
* Application unavailable troubleshooting

---

## Phase 3 – Git

Professional Git workflow:

```text
main
 │
 ▼
develop
 ├── feature/login
 ├── feature/profile
 └── bugfix/header
```

Additional Git recovery scenarios:

* Removing secrets
* Recovering deleted branches
* Fixing commit messages
* Undoing commits
* Cloning repositories

---

## Phase 4 – Bash Scripting

Five production-oriented automation scripts were developed:

* backup.sh
* health.sh
* app-monitor.sh
* disk-monitor.sh
* user-report.sh

Each script includes logging, error handling, and verification.

---

## Phase 5 – Cron Automation

Automated scheduling of:

* Daily backups
* Server health reports
* Disk monitoring
* Application monitoring
* User reports
* Weekly log cleanup

Cron troubleshooting scenarios were also implemented and documented.

---

# Learning Outcomes

After completing this project, the following practical skills were acquired:

* Linux Administration
* Linux Security
* User Management
* Permission Management
* Process Monitoring
* Resource Monitoring
* Service Management
* Bash Scripting
* Git Workflow
* Git Troubleshooting
* Cron Automation
* Server Monitoring
* Production Troubleshooting
* AWS EC2 Administration
* Technical Documentation

---

# Best Practices Followed

* Principle of Least Privilege
* Role-Based Access Control (RBAC)
* Automation over Manual Operations
* Comprehensive Logging
* Timestamped Backups
* Absolute Paths in Scripts
* Scheduled Monitoring
* Documentation-Driven Development
* Version Control Best Practices

---

# Expected Outcomes

Upon successful completion, the project demonstrates the ability to:

* Deploy and manage Linux servers on AWS.
* Configure secure user access.
* Troubleshoot common Linux production issues.
* Automate repetitive administrative tasks.
* Implement scheduled operations using Cron.
* Manage source code using professional Git workflows.
* Produce operational reports and logs.
* Follow industry-standard DevOps practices.

---

# Conclusion

This project represents a practical implementation of Linux system administration and DevOps automation in a cloud environment. It combines infrastructure management, scripting, monitoring, troubleshooting, and version control into a single portfolio project that reflects real-world operational responsibilities. The implementation provides hands-on experience with production-oriented workflows and establishes a strong foundation for advanced DevOps tools such as Docker, Kubernetes, Ansible, Terraform, Jenkins, and CI/CD pipelines.
