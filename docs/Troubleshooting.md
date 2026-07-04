# Troubleshooting Guide

# Linux DevOps Administration & Automation on AWS

## Overview

This document summarizes the troubleshooting scenarios implemented during the project. Each issue follows a structured approach:

1. Identify the problem
2. Investigate the root cause
3. Apply the appropriate fix
4. Verify the solution
5. Document the outcome

---

# Troubleshooting Workflow

```text
Issue Reported
      │
      ▼
Collect Information
      │
      ▼
Investigate
      │
      ▼
Find Root Cause
      │
      ▼
Apply Fix
      │
      ▼
Verify Solution
      │
      ▼
Document Resolution
```

---

# Scenario 1 – Permission Denied

## Problem

Developers were unable to access the application directory.

```
Permission denied
```

## Investigation

Checked ownership:

```bash
ls -ld /company-app/app
```

Checked permissions:

```bash
ls -l /company-app
```

Checked user groups:

```bash
id developer1
```

## Root Cause

* Incorrect directory ownership
* User not in the required group
* Insufficient permissions

## Solution

```bash
sudo chown -R devops1:developers /company-app/app
sudo chmod -R 770 /company-app/app
sudo usermod -aG developers developer1
```

## Verification

```bash
su - developer1
cd /company-app/app
```

Result:

Developer successfully accessed the application directory.

---

# Scenario 2 – Disk Usage Reached 100%

## Problem

Server disk utilization became critically high.

## Investigation

Check filesystem usage:

```bash
df -h
```

Find largest directories:

```bash
du -sh /* | sort -hr
```

Find large files:

```bash
find / -type f -size +100M
```

## Root Cause

* Old backup archives
* Temporary files
* Large log files

## Solution

Remove unnecessary backups:

```bash
find /company-app/backups -mtime +7 -delete
```

Clean temporary files:

```bash
sudo rm -rf /tmp/*
```

Clean package cache:

```bash
sudo apt clean
```

## Verification

```bash
df -h
```

Result:

Disk usage reduced to a healthy level.

---

# Scenario 3 – Server Performance Issues

## Problem

The server became slow and unresponsive.

## Investigation

CPU usage:

```bash
top
```

Memory:

```bash
free -h
```

Processes:

```bash
ps aux --sort=-%cpu | head
```

Disk I/O:

```bash
iostat
```

## Root Cause

A resource-intensive process was consuming excessive CPU and memory.

## Solution

Identify the process:

```bash
top
```

Terminate the process:

```bash
kill -9 <PID>
```

## Verification

```bash
top
```

Result:

CPU and memory utilization returned to normal.

---

# Scenario 4 – Nginx Service Stopped

## Problem

The web application became unavailable because Nginx stopped.

## Investigation

Check service:

```bash
systemctl status nginx
```

View logs:

```bash
journalctl -u nginx
```

Validate configuration:

```bash
nginx -t
```

## Root Cause

Nginx service was stopped.

## Solution

```bash
sudo systemctl restart nginx
```

Enable automatic startup:

```bash
sudo systemctl enable nginx
```

## Verification

```bash
systemctl status nginx
```

```bash
curl http://localhost
```

Result:

Application became accessible again.

---

# Scenario 5 – Application Not Accessible

## Problem

Application could not be accessed using the EC2 public IP.

## Investigation

Check service:

```bash
systemctl status nginx
```

Check process:

```bash
ps -ef | grep nginx
```

Check listening port:

```bash
ss -tulpn | grep :80
```

Test locally:

```bash
curl http://localhost
```

Review Security Group rules.

Review firewall status:

```bash
sudo ufw status
```

## Root Cause

HTTP traffic was blocked or the web service was unavailable.

## Solution

* Restarted Nginx
* Verified Security Group allowed port 80
* Confirmed firewall configuration

## Verification

```bash
curl http://localhost
```

Opened:

```
http://<EC2-PUBLIC-IP>
```

Result:

Application became accessible from the browser.

---

# Git Troubleshooting

## Secret File Committed

### Problem

`.env` file containing sensitive information was committed.

### Solution

```bash
git rm --cached .env
```

Add to `.gitignore`

```text
.env
```

Commit the changes.

---

## Wrong Commit Message

### Solution

```bash
git commit --amend -m "Correct commit message"
```

---

## Undo Previous Commit

```bash
git reset --soft HEAD~1
```

Changes were preserved while removing the last commit.

---

## Recover Deleted Branch

```bash
git reflog
git checkout -b feature/test <commit-id>
```

Recovered the deleted branch successfully.

---

# Bash Script Troubleshooting

## Script Permission Denied

### Investigation

```bash
ls -l backup.sh
```

### Solution

```bash
chmod +x backup.sh
```

---

## Variables Empty

### Root Cause

Variables were not initialized correctly or commands returned no output.

### Solution

Verified variable assignments and used absolute paths.

---

## Corrupted Backup Archive

### Investigation

```bash
tar -tzf backup.tar.gz
```

### Root Cause

Application files were missing or incorrect source path was used.

### Solution

Corrected the source directory and regenerated the archive.

---

# Cron Troubleshooting

## Cron Job Never Executed

### Investigation

```bash
systemctl status cron
```

```bash
crontab -l
```

### Root Cause

Cron service was stopped or the script lacked execute permission.

### Solution

```bash
sudo systemctl start cron
chmod +x /company-app/scripts/*.sh
```

---

## Cron Created Empty Files

### Root Cause

Relative paths were used.

### Solution

Replaced all relative paths with absolute paths.

Example:

```bash
/company-app/app
```

instead of

```bash
app/
```

---

## Script Worked Manually but Failed in Cron

### Root Cause

Cron uses a minimal environment.

### Solution

* Added `#!/bin/bash`
* Used absolute paths
* Redirected output to logs

Example:

```cron
*/5 * * * * /company-app/scripts/health.sh >> /tmp/health.log 2>&1
```

---

# Useful Troubleshooting Commands

| Task              | Command                   |
| ----------------- | ------------------------- |
| Service Status    | `systemctl status nginx`  |
| Restart Service   | `systemctl restart nginx` |
| Running Processes | `ps aux`                  |
| CPU Usage         | `top`                     |
| Memory Usage      | `free -h`                 |
| Disk Usage        | `df -h`                   |
| Directory Size    | `du -sh *`                |
| Open Ports        | `ss -tulpn`               |
| Logs              | `journalctl`              |
| Network Test      | `ping google.com`         |
| Local Web Test    | `curl http://localhost`   |
| Git History       | `git log --oneline`       |
| Recover Commit    | `git reflog`              |
| Cron Jobs         | `crontab -l`              |

---

# Key Takeaways

* Always investigate before applying a fix.
* Validate file ownership and permissions first.
* Monitor CPU, memory, and disk regularly.
* Check service status before restarting applications.
* Review system and application logs for root-cause analysis.
* Use absolute paths in Bash scripts and Cron jobs.
* Test scripts manually before scheduling them.
* Keep backups and logs organized.
* Document every issue, investigation, and resolution.

---

# Conclusion

This project simulated common Linux administration and DevOps incidents encountered in production environments. By following a structured troubleshooting methodology, each issue was successfully investigated, resolved, verified, and documented. These exercises strengthened practical skills in Linux administration, automation, Git workflows, and operational problem-solving on AWS.
