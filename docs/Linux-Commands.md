# Linux Commands Reference

## Overview

This document contains the most important Linux commands used throughout the **Linux DevOps Administration & Automation on AWS** project. These commands are grouped by category and include their purpose, syntax, and examples.

---

# File & Directory Management

## Print Current Directory

```bash id="cmd1"
pwd
```

Displays the current working directory.

---

## List Files

```bash id="cmd2"
ls
```

List files in the current directory.

Useful options:

```bash id="cmd3"
ls -l
```

Long listing format.

```bash id="cmd4"
ls -la
```

Show hidden files.

---

## Change Directory

```bash id="cmd5"
cd /company-app
```

Navigate to another directory.

---

## Create Directory

```bash id="cmd6"
mkdir logs
```

Create a new directory.

Multiple directories:

```bash id="cmd7"
mkdir -p app logs backups scripts
```

---

## Create File

```bash id="cmd8"
touch test.txt
```

---

## Copy Files

```bash id="cmd9"
cp source.txt destination.txt
```

Recursive copy:

```bash id="cmd10"
cp -r app backup
```

---

## Move or Rename

```bash id="cmd11"
mv old.txt new.txt
```

---

## Remove File

```bash id="cmd12"
rm file.txt
```

Remove directory recursively:

```bash id="cmd13"
rm -rf directory
```

---

# File Viewing

View file:

```bash id="cmd14"
cat file.txt
```

View first lines:

```bash id="cmd15"
head file.txt
```

View last lines:

```bash id="cmd16"
tail file.txt
```

Follow log file:

```bash id="cmd17"
tail -f /var/log/syslog
```

---

# Search Commands

Find files:

```bash id="cmd18"
find / -name "*.log"
```

Find large files:

```bash id="cmd19"
find / -type f -size +100M
```

Search text:

```bash id="cmd20"
grep nginx /var/log/syslog
```

---

# User Management

Create user:

```bash id="cmd21"
sudo adduser developer1
```

Delete user:

```bash id="cmd22"
sudo userdel developer1
```

Change password:

```bash id="cmd23"
sudo passwd developer1
```

User information:

```bash id="cmd24"
id developer1
```

Current user:

```bash id="cmd25"
whoami
```

Logged-in users:

```bash id="cmd26"
who
```

Last login:

```bash id="cmd27"
last
```

---

# Group Management

Create group:

```bash id="cmd28"
sudo groupadd developers
```

Add user to group:

```bash id="cmd29"
sudo usermod -aG developers developer1
```

View groups:

```bash id="cmd30"
groups developer1
```

---

# Permissions

Change permissions:

```bash id="cmd31"
chmod 755 file.txt
```

Recursive permissions:

```bash id="cmd32"
chmod -R 770 /company-app
```

Change ownership:

```bash id="cmd33"
chown developer1:developers file.txt
```

Recursive ownership:

```bash id="cmd34"
chown -R devops1:developers /company-app
```

---

# Disk Management

Filesystem usage:

```bash id="cmd35"
df -h
```

Directory size:

```bash id="cmd36"
du -sh *
```

Largest directories:

```bash id="cmd37"
du -sh /* | sort -hr
```

---

# Memory Monitoring

Memory usage:

```bash id="cmd38"
free -h
```

Virtual memory:

```bash id="cmd39"
vmstat
```

---

# CPU & Process Management

Interactive process monitor:

```bash id="cmd40"
top
```

View processes:

```bash id="cmd41"
ps aux
```

Top CPU processes:

```bash id="cmd42"
ps aux --sort=-%cpu | head
```

Kill process:

```bash id="cmd43"
kill -9 PID
```

---

# Service Management

Check status:

```bash id="cmd44"
systemctl status nginx
```

Start service:

```bash id="cmd45"
sudo systemctl start nginx
```

Stop service:

```bash id="cmd46"
sudo systemctl stop nginx
```

Restart service:

```bash id="cmd47"
sudo systemctl restart nginx
```

Enable at boot:

```bash id="cmd48"
sudo systemctl enable nginx
```

---

# Logs

View service logs:

```bash id="cmd49"
journalctl -u nginx
```

Recent logs:

```bash id="cmd50"
journalctl -xe
```

---

# Networking

Check IP address:

```bash id="cmd51"
ip addr
```

Ping server:

```bash id="cmd52"
ping google.com
```

Test website:

```bash id="cmd53"
curl http://localhost
```

Open ports:

```bash id="cmd54"
ss -tulpn
```

SSH connection:

```bash id="cmd55"
ssh -i key.pem ubuntu@<EC2-PUBLIC-IP>
```

---

# Compression

Create archive:

```bash id="cmd56"
tar -czf backup.tar.gz app
```

Extract archive:

```bash id="cmd57"
tar -xzf backup.tar.gz
```

---

# Cron

Edit cron jobs:

```bash id="cmd58"
crontab -e
```

View cron jobs:

```bash id="cmd59"
crontab -l
```

Cron service:

```bash id="cmd60"
systemctl status cron
```

---

# Bash Scripts

Run script:

```bash id="cmd61"
./backup.sh
```

Executable permission:

```bash id="cmd62"
chmod +x backup.sh
```

Run with Bash:

```bash id="cmd63"
bash backup.sh
```

---

# Git Commands

Initialize repository:

```bash id="cmd64"
git init
```

Clone repository:

```bash id="cmd65"
git clone <repository-url>
```

Check status:

```bash id="cmd66"
git status
```

Commit changes:

```bash id="cmd67"
git commit -m "message"
```

Create branch:

```bash id="cmd68"
git checkout -b feature/login
```

Merge branch:

```bash id="cmd69"
git merge feature/login
```

Push repository:

```bash id="cmd70"
git push origin main
```

---

# AWS EC2

Update packages:

```bash id="cmd71"
sudo apt update && sudo apt upgrade -y
```

Install Nginx:

```bash id="cmd72"
sudo apt install nginx -y
```

Check OS version:

```bash id="cmd73"
lsb_release -a
```

Check hostname:

```bash id="cmd74"
hostname
```

System uptime:

```bash id="cmd75"
uptime
```

---

# Commands Used Most in This Project

| Category        | Commands                                          |
| --------------- | ------------------------------------------------- |
| Navigation      | `pwd`, `cd`, `ls`                                 |
| File Management | `mkdir`, `cp`, `mv`, `rm`, `touch`                |
| Search          | `find`, `grep`                                    |
| Users           | `adduser`, `usermod`, `groups`, `id`              |
| Permissions     | `chmod`, `chown`                                  |
| Monitoring      | `top`, `free`, `df`, `du`, `ps`                   |
| Services        | `systemctl`, `journalctl`                         |
| Networking      | `ping`, `curl`, `ss`, `ssh`                       |
| Compression     | `tar`                                             |
| Cron            | `crontab`                                         |
| Git             | `git init`, `git commit`, `git merge`, `git push` |

---

# Best Practices

* Use `sudo` only when necessary.
* Always verify commands before deleting files.
* Prefer absolute paths in automation scripts.
* Check service status before restarting.
* Test scripts manually before scheduling them with Cron.
* Keep backups before making major changes.
* Use Git for version control and maintain meaningful commit messages.

---

# Summary

These commands represent the core Linux administration toolkit used throughout this project. Mastering them provides a strong foundation for Linux Administration, DevOps Engineering, Cloud Engineering, and Site Reliability Engineering (SRE) roles.
