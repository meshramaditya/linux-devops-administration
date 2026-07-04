# Linux DevOps Administration & Automation on AWS

# Interview Questions & Answers

## Linux Fundamentals

### 1. What is Linux?

**Answer:** Linux is an open-source, Unix-like operating system used for servers, cloud infrastructure, DevOps, networking, and embedded systems due to its stability, security, and flexibility.

---

### 2. Why is Linux preferred for servers?

**Answer:** It offers high performance, security, stability, low resource usage, extensive automation capabilities, and strong community support.

---

### 3. What is the Linux file system hierarchy?

**Answer:** It is a standardized directory structure that organizes system files under directories such as `/etc`, `/home`, `/var`, `/usr`, `/opt`, and `/tmp`.

---

### 4. What is the difference between absolute and relative paths?

**Answer:**

* Absolute path starts from `/`.
* Relative path starts from the current working directory.

---

### 5. How do you check your current directory?

**Answer:**

```bash id="l1"
pwd
```

---

## Users and Groups

### 6. How do you create a new user?

```bash id="l2"
sudo adduser developer1
```

---

### 7. How do you create a group?

```bash id="l3"
sudo groupadd developers
```

---

### 8. How do you add a user to a group?

```bash id="l4"
sudo usermod -aG developers developer1
```

---

### 9. How do you verify group membership?

```bash id="l5"
groups developer1
```

---

### 10. Why are groups used?

**Answer:** Groups simplify permission management by assigning access to multiple users collectively instead of individually.

---

## Permissions

### 11. What do the permissions 777 mean?

**Answer:** Read, write, and execute permissions for owner, group, and others.

---

### 12. What does 755 represent?

**Answer:**

* Owner: rwx
* Group: r-x
* Others: r-x

---

### 13. What does 770 represent?

**Answer:**

* Owner: rwx
* Group: rwx
* Others: no access

---

### 14. Difference between `chmod` and `chown`?

**Answer:**

* `chmod` changes permissions.
* `chown` changes ownership.

---

### 15. What is SGID?

**Answer:** SGID ensures newly created files inherit the parent directory's group ownership, making collaboration easier.

---

### 16. Why did you use SGID in your project?

**Answer:** To ensure all developers automatically shared the same group ownership in the collaboration directory.

---

### 17. What is the Sticky Bit?

**Answer:** It prevents users from deleting files owned by other users in shared directories such as `/tmp`.

---

## Linux Commands

### 18. Difference between `df` and `du`?

**Answer:**

* `df` shows filesystem usage.
* `du` shows directory or file size.

---

### 19. How do you find large directories?

```bash id="l6"
du -sh * | sort -hr
```

---

### 20. How do you find large files?

```bash id="l7"
find / -type f -size +100M
```

---

### 21. How do you check memory usage?

```bash id="l8"
free -h
```

---

### 22. How do you monitor CPU usage?

```bash id="l9"
top
```

---

### 23. How do you view running processes?

```bash id="l10"
ps aux
```

---

### 24. How do you check open ports?

```bash id="l11"
ss -tulpn
```

---

### 25. How do you check disk usage?

```bash id="l12"
df -h
```

---

## Services

### 26. How do you check service status?

```bash id="l13"
systemctl status nginx
```

---

### 27. How do you restart a service?

```bash id="l14"
sudo systemctl restart nginx
```

---

### 28. Difference between restart and reload?

**Answer:**

* Restart stops and starts the service.
* Reload applies configuration changes without stopping the service (if supported).

---

### 29. How do you enable a service at boot?

```bash id="l15"
sudo systemctl enable nginx
```

---

### 30. Where do you check service logs?

**Answer:** Using:

```bash id="l16"
journalctl -u nginx
```

---

## Troubleshooting

### 31. How do you troubleshoot "Permission denied"?

**Answer:** Check ownership (`ls -l`), permissions (`chmod`), and user/group membership (`id`, `groups`).

---

### 32. What would you do if disk usage reached 100%?

**Answer:** Use `df -h`, `du`, and `find` to locate unnecessary files, remove or archive them, and verify free space.

---

### 33. How do you identify high CPU usage?

**Answer:** Use `top`, `htop`, or `ps aux --sort=-%cpu`.

---

### 34. How do you identify memory issues?

**Answer:** Use `free -h`, `top`, and `vmstat`.

---

### 35. How do you troubleshoot an application that is down?

**Answer:** Check the service, process, listening port, firewall/security group, logs, and test locally with `curl`.

---

## AWS

### 36. Why did you use AWS EC2?

**Answer:** It provides a cloud-based Linux server for practicing administration and DevOps tasks in a realistic environment.

---

### 37. What is a Security Group?

**Answer:** A virtual firewall that controls inbound and outbound traffic to AWS resources.

---

### 38. Which ports were opened?

**Answer:**

* 22 (SSH)
* 80 (HTTP)
* 443 (HTTPS, if required)

---

### 39. Why use EBS?

**Answer:** EBS provides persistent block storage that remains attached to the EC2 instance even after a reboot.

---

## Git

### 40. Which Git workflow did you implement?

**Answer:**

* `main`
* `develop`
* `feature/login`
* `feature/profile`
* `bugfix/header`

---

### 41. What is a merge conflict?

**Answer:** It occurs when Git cannot automatically merge changes because the same section of a file was modified in different branches.

---

### 42. How did you resolve the merge conflict?

**Answer:** Edited the conflicted file, removed conflict markers, staged the resolved file, and completed the merge.

---

### 43. Difference between `git reset` and `git revert`?

**Answer:**

* `git reset` rewrites history.
* `git revert` creates a new commit that reverses previous changes.

---

### 44. What is `git reflog`?

**Answer:** It records where `HEAD` and branch references have pointed, allowing recovery of deleted commits or branches.

---

### 45. Why use feature branches?

**Answer:** They isolate development work, enabling multiple developers to work independently.

---

## Bash Scripting

### 46. Why automate tasks using Bash?

**Answer:** Automation reduces manual effort, improves consistency, and minimizes human error.

---

### 47. What does the backup script do?

**Answer:** It compresses the application, adds a timestamp, stores the archive, deletes backups older than seven days, and logs execution.

---

### 48. Why use timestamps in backups?

**Answer:** To avoid overwriting previous backups and maintain historical copies.

---

### 49. What does the health script collect?

**Answer:** CPU, memory, disk usage, uptime, running services, open ports, and internet connectivity.

---

### 50. What does the application monitor do?

**Answer:** It checks if Nginx is running, restarts it if necessary, logs the event, and generates alerts.

---

## Cron

### 51. What is Cron?

**Answer:** Cron is a Linux scheduler that automatically executes commands or scripts at specified times.

---

### 52. How did you schedule daily backups?

**Answer:**

```text id="cron1"
0 2 * * * /company-app/scripts/backup.sh
```

---

### 53. Why do Cron jobs sometimes fail?

**Answer:** Common reasons include missing execute permissions, incorrect paths, missing environment variables, or the Cron service not running.

---

### 54. Why should scripts use absolute paths?

**Answer:** Cron executes scripts with a minimal environment and may not use the expected working directory.

---

## Project-Based Questions

### 55. Explain your project in one minute.

**Answer:** I built a Linux administration and automation environment on AWS EC2 where I configured users, groups, permissions, shared directories, automated backups, server health monitoring, application monitoring, disk monitoring, Git workflows, and Cron scheduling while documenting troubleshooting scenarios and best practices.

---

### 56. What was the biggest challenge?

**Answer:** Troubleshooting permission issues, resolving Git merge conflicts, and debugging Cron jobs that worked manually but failed automatically.

---

### 57. What Linux skills did you gain?

**Answer:** User management, permissions, service management, monitoring, troubleshooting, Bash scripting, and Cron automation.

---

### 58. What DevOps skills did you gain?

**Answer:** Git workflows, automation, operational troubleshooting, logging, monitoring, and cloud-based Linux administration on AWS.

---

### 59. If you had more time, what would you improve?

**Answer:** I would integrate Docker, Jenkins, Terraform, Ansible, Prometheus, Grafana, CloudWatch, and GitHub Actions to extend the project into a complete CI/CD and cloud-native environment.

---

### 60. Why should we hire you for a DevOps role?

**Answer:** I have hands-on experience administering Linux systems on AWS, automating operational tasks with Bash and Cron, troubleshooting real-world scenarios, following structured Git workflows, and documenting solutions using industry best practices. I enjoy learning new technologies and continuously improving automation and operational reliability.

---

# Quick Interview Tips

* Explain your troubleshooting approach before giving commands.
* Mention **security**, **automation**, and **verification** in your answers.
* Describe **why** you used a command, not just **how**.
* Use examples from your project to demonstrate practical experience.
* Always mention best practices such as least privilege, logging, backups, and automation.

---

# Final Advice

This project demonstrates practical Linux administration, automation, troubleshooting, Git workflows, and AWS operations. During interviews, focus on explaining the **problem**, **investigation**, **solution**, and **verification** for each task. Interviewers value structured thinking and hands-on experience as much as command knowledge.
