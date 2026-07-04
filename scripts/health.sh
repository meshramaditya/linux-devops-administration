#!/bin/bash

# ==========================================================
# Project : Linux DevOps Administration & Automation on AWS
# Script  : health.sh
# Purpose : Generate a server health report
# ==========================================================

REPORT_DIR="/company-app/logs"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/server_health_$DATE.txt"

mkdir -p "$REPORT_DIR"

echo "Generating Server Health Report..."

{

echo "==========================================================="
echo "           SERVER HEALTH REPORT"
echo "==========================================================="
echo "Generated On : $(date)"
echo "Hostname     : $(hostname)"
echo "OS           : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo

# ======================================================
echo "CPU INFORMATION"
echo "-------------------------------------------------------"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')

echo "CPU Usage : ${CPU_USAGE}%"
echo

# ======================================================
echo "MEMORY INFORMATION"
echo "-------------------------------------------------------"

free -h

echo

# ======================================================
echo "DISK INFORMATION"
echo "-------------------------------------------------------"

df -h /

echo

# ======================================================
echo "SYSTEM UPTIME"
echo "-------------------------------------------------------"

uptime

echo

# ======================================================
echo "INTERNET CONNECTIVITY"
echo "-------------------------------------------------------"

if ping -c 2 google.com >/dev/null 2>&1
then
    echo "Status : Connected"
else
    echo "Status : Not Connected"
fi

echo

# ======================================================
echo "RUNNING SERVICES"
echo "-------------------------------------------------------"

systemctl list-units --type=service --state=running | head -20

echo

# ======================================================
echo "TOP 5 CPU PROCESSES"
echo "-------------------------------------------------------"

ps aux --sort=-%cpu | head -6

echo

# ======================================================
echo "TOP 5 MEMORY PROCESSES"
echo "-------------------------------------------------------"

ps aux --sort=-%mem | head -6

echo

# ======================================================
echo "OPEN PORTS"
echo "-------------------------------------------------------"

ss -tulpn

echo

echo "==========================================================="
echo "END OF REPORT"
echo "==========================================================="

} > "$REPORT_FILE"

echo "Health report generated successfully."
echo "Location : $REPORT_FILE"
