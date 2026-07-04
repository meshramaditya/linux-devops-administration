# Cron Troubleshooting Guide

## Overview

Cron is the Linux job scheduler used to execute commands and scripts automatically at scheduled intervals. While Cron is reliable, jobs may fail due to configuration errors, permissions, missing environment variables, or incorrect paths.

This document describes common Cron issues, investigation steps, root causes, and solutions.

---

# Scenario 1 – Cron Job Never Executes

## Problem

A scheduled Cron job does not run at the expected time.

Example:

```cron
0 2 * * * /company-app/scripts/backup.sh
```

No backup file is created after 2:00 AM.

---

## Investigation

### Check Cron Service

```bash
sudo systemctl status cron
```

Expected:

```
Active: active (running)
```

If the service is stopped:

```bash
sudo systemctl enable cron
sudo systemctl start cron
```

---

### Verify Scheduled Jobs

```bash
crontab -l
```

Ensure the correct schedule and script path are configured.

---

### Verify Script Exists

```bash
ls -l /company-app/scripts/
```

Confirm the script exists.

---

### Verify Execute Permission

```bash
chmod +x /company-app/scripts/backup.sh
```

---

### Execute Manually

```bash
/company-app/scripts/backup.sh
```

If manual execution fails, the issue is with the script itself rather than Cron.

---

### Check Cron Logs

Ubuntu:

```bash
journalctl -u cron
```

or

```bash
grep CRON /var/log/syslog
```

---

## Root Cause

The backup script was missing execute permission.

---

## Solution

```bash
chmod +x /company-app/scripts/backup.sh
```

Cron executed successfully after permissions were corrected.

---

# Scenario 2 – Cron Creates Empty Files

## Problem

Cron runs successfully but generated files are empty.

---

## Investigation

The script used relative paths:

```bash
cd app
```

Cron executes from a different working directory, so the command failed.

---

## Solution

Use absolute paths.

Incorrect:

```bash
cd app
```

Correct:

```bash
cd /company-app/app
```

---

### Verify Command Locations

```bash
which tar
which find
which date
```

Example:

```
/usr/bin/tar
/usr/bin/find
/usr/bin/date
```

Use full paths if required.

---

### Capture Errors

```cron
* * * * * /company-app/scripts/backup.sh >> /tmp/backup.log 2>&1
```

Inspect:

```bash
cat /tmp/backup.log
```

---

## Root Cause

Relative paths caused the script to execute in the wrong directory.

---

## Resolution

Converted all paths to absolute paths.

---

# Scenario 3 – Script Works Manually but Fails in Cron

## Problem

The script executes correctly from the terminal but fails when executed by Cron.

---

## Investigation

Manual execution:

```bash
/company-app/scripts/health.sh
```

Successful.

Cron execution:

```cron
*/5 * * * * /company-app/scripts/health.sh
```

Failed.

---

## Possible Causes

### Missing PATH

Interactive shells contain more environment variables than Cron.

Display current PATH:

```bash
echo $PATH
```

If required, define PATH explicitly in the script:

```bash
export PATH=/usr/local/bin:/usr/bin:/bin
```

---

### Relative Paths

Always use:

```bash
/company-app/scripts
```

instead of:

```bash
scripts
```

---

### Missing Execute Permission

```bash
chmod +x *.sh
```

---

### Missing Shebang

Every script should begin with:

```bash
#!/bin/bash
```

---

### Environment Variables

Cron does not automatically load your shell profile.

If the script depends on custom variables, define them inside the script or source the appropriate profile.

---

### Redirect Output

```cron
*/5 * * * * /company-app/scripts/health.sh >> /tmp/health.log 2>&1
```

Review:

```bash
cat /tmp/health.log
```

---

# Cron Debugging Checklist

* Verify Cron service is running.
* Verify the Cron schedule.
* Confirm the script path.
* Ensure execute permissions are set.
* Use absolute paths.
* Include a valid shebang.
* Test the script manually.
* Redirect output to a log file.
* Review Cron logs.
* Verify file and directory permissions.

---

# Useful Commands

## Check Cron Status

```bash
sudo systemctl status cron
```

## Start Cron

```bash
sudo systemctl start cron
```

## Enable Cron at Boot

```bash
sudo systemctl enable cron
```

## View Cron Jobs

```bash
crontab -l
```

## Edit Cron Jobs

```bash
crontab -e
```

## Remove Cron Jobs

```bash
crontab -r
```

## View Cron Logs

```bash
journalctl -u cron
```

---

# Best Practices

* Always use absolute paths.
* Test scripts manually before scheduling them.
* Log every execution.
* Redirect standard output and errors during debugging.
* Store scripts in a dedicated directory.
* Keep scripts executable.
* Rotate or clean old log files regularly.
* Document every scheduled job with comments.

---

# Learning Outcomes

After completing this Cron implementation, the following skills were demonstrated:

* Linux task scheduling using Cron
* Bash automation
* Backup scheduling
* Health monitoring
* Disk monitoring
* Application self-healing
* Automated reporting
* Log cleanup
* Cron troubleshooting
* Production debugging techniques

---

# Conclusion

Cron provides a simple and reliable method for automating repetitive administrative tasks. By combining Cron with Bash scripts, routine operations such as backups, monitoring, reporting, and application recovery can be performed automatically, reducing manual effort and improving system reliability.
