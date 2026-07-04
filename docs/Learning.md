# Learning

# Skills and Knowledge Gained

## Overview

The **Linux DevOps Administration & Automation on AWS** project provided hands-on experience with Linux system administration, cloud infrastructure management, automation, troubleshooting, and version control. Rather than focusing only on theoretical concepts, this project emphasized implementing real-world administrative tasks, solving operational issues, and automating repetitive processes.

Each phase introduced new concepts while reinforcing previously learned topics, resulting in a practical understanding of how Linux and DevOps engineers manage production environments.

---

# Phase 1 – Linux Administration

## Key Learnings

During this phase, I learned how to build and manage a secure Linux environment on an AWS EC2 instance.

### Linux File System

Topics covered:

* Linux directory hierarchy
* Creating directories
* Organizing application files
* Managing project structures
* Understanding the purpose of system directories

### User Management

Skills learned:

* Creating Linux users
* Modifying user accounts
* Setting passwords
* Managing user home directories
* Verifying user access

### Group Management

Topics learned:

* Creating groups
* Adding users to groups
* Managing shared access
* Verifying group membership
* Group-based permission management

### File Ownership

Practical experience with:

* File owners
* Group ownership
* Recursive ownership changes
* Ownership verification

### Linux Permissions

Implemented:

* Read permissions
* Write permissions
* Execute permissions
* Numeric permissions
* Symbolic permissions
* Special permissions (SGID and Sticky Bit)

### Shared Directories

Learned how to:

* Configure collaborative directories
* Use the SGID bit
* Allow multiple developers to work together securely
* Maintain consistent group ownership

### Server Monitoring

Collected information about:

* CPU usage
* Memory usage
* Disk utilization
* Running services
* Open ports
* System uptime
* Running processes

---

# Phase 2 – Linux Troubleshooting

This phase focused on identifying, investigating, and resolving common production issues.

## Permission Issues

Learned to investigate:

* Permission denied errors
* Ownership problems
* Incorrect group assignments
* Directory access failures

## Disk Management

Practiced:

* Identifying large files
* Locating large directories
* Cleaning unnecessary data
* Protecting application files during cleanup

## Performance Troubleshooting

Investigated:

* High CPU utilization
* Memory exhaustion
* Disk bottlenecks
* Load averages
* Resource-intensive processes

## Service Management

Learned to:

* Start services
* Stop services
* Restart services
* Enable services at boot
* Verify service status

## Application Troubleshooting

Performed systematic investigations using:

* Service status
* Running processes
* Network ports
* Firewall configuration
* System logs
* Application logs

---

# Phase 3 – Git

This phase introduced professional version control workflows.

## Repository Management

Learned:

* Repository initialization
* Repository cloning
* Remote repository configuration
* Repository synchronization

## Git Branching

Implemented:

* Main branch
* Develop branch
* Feature branches
* Bugfix branches

## Merge Operations

Practiced:

* Fast-forward merges
* Standard merges
* Merge conflict resolution

## Git Recovery

Solved common problems including:

* Removing accidentally committed secrets
* Recovering deleted branches
* Fixing incorrect commit messages
* Undoing commits without losing work

---

# Phase 4 – Bash Scripting

This phase introduced Linux automation through shell scripting.

## Bash Fundamentals

Learned:

* Variables
* Conditional statements
* Loops
* Functions
* Exit codes
* Command substitution

## Automation Scripts

Developed:

### Backup Script

Features:

* Timestamped backups
* Compression
* Backup cleanup
* Execution logging

### Health Monitoring Script

Collected:

* CPU usage
* Memory usage
* Disk usage
* Running services
* Internet connectivity
* System uptime

### Application Monitor

Implemented:

* Service health checks
* Automatic restart
* Alert generation
* Logging

### Disk Monitor

Implemented:

* Disk usage monitoring
* Threshold-based alerts
* Usage logging

### User Report

Generated reports containing:

* Linux users
* Logged-in users
* Login history
* Group membership

---

# Phase 5 – Cron Automation

This phase automated the Bash scripts.

## Cron Scheduling

Configured automated execution for:

* Daily backups
* Health monitoring
* Disk monitoring
* User reporting
* Application monitoring
* Log cleanup

## Cron Troubleshooting

Learned to resolve:

* Jobs that never execute
* Missing environment variables
* Relative path issues
* Permission problems
* PATH-related failures

---

# AWS Knowledge

The project strengthened practical AWS skills.

## Amazon EC2

Worked with:

* Instance creation
* SSH connectivity
* Ubuntu administration
* Security Groups
* EBS storage

## Remote Administration

Performed administration using:

* SSH
* Terminal commands
* Remote configuration
* Secure access management

---

# Linux Commands Practiced

Frequently used commands included:

### File Management

* pwd
* ls
* mkdir
* cp
* mv
* rm
* touch
* find

### User Management

* adduser
* usermod
* passwd
* groups
* id

### Permissions

* chmod
* chown
* chgrp

### Monitoring

* top
* htop
* ps
* free
* df
* du
* uptime
* vmstat
* ss

### Services

* systemctl
* journalctl

### Networking

* ping
* curl
* ssh

### Git

* git init
* git add
* git commit
* git branch
* git checkout
* git merge
* git log
* git reflog
* git push

---

# Soft Skills Developed

Beyond technical knowledge, this project also improved:

* Analytical thinking
* Problem-solving
* Documentation skills
* Debugging methodology
* Time management
* Attention to detail
* Structured troubleshooting
* Automation mindset

---

# Best Practices Learned

The following industry practices were applied throughout the project:

* Principle of Least Privilege
* Role-Based Access Control
* Documentation-first approach
* Automation over manual processes
* Consistent logging
* Secure file permissions
* Structured Git workflow
* Incremental testing
* Verification after every change

---

# Challenges Overcome

Throughout the project, I successfully resolved:

* Linux permission errors
* Disk space issues
* Service failures
* High resource utilization
* Git merge conflicts
* Cron scheduling failures
* Script execution errors
* Application accessibility problems

Each challenge improved my confidence in diagnosing and resolving production-like incidents.

---

# Future Learning Goals

To continue building on this foundation, I plan to learn:

* Docker
* Kubernetes
* Terraform
* Ansible
* Jenkins
* GitHub Actions
* Prometheus
* Grafana
* Amazon CloudWatch
* Amazon EKS
* Infrastructure as Code (IaC)
* Advanced Linux security
* CI/CD pipeline automation

---

# Summary

This project provided practical exposure to Linux administration, cloud infrastructure, automation, troubleshooting, and version control within an AWS environment. By completing each phase, I developed the ability to manage Linux servers, automate operational tasks, investigate production-style issues, and document technical implementations using industry best practices.

The knowledge and experience gained from this project establish a strong foundation for pursuing advanced DevOps, Cloud Engineering, and Site Reliability Engineering (SRE) practices.
