#!/bin/bash

# ==========================================================
# Project : Linux DevOps Administration & Automation on AWS
# Script  : user-report.sh
# Purpose : Generate Linux user and group report
# ==========================================================

REPORT_DIR="/company-app/logs"
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="$REPORT_DIR/user_report_$DATE.txt"

mkdir -p "$REPORT_DIR"

{
echo "==========================================================="
echo "              USER MANAGEMENT REPORT"
echo "==========================================================="
echo "Generated On : $(date)"
echo "Hostname     : $(hostname)"
echo "Current User : $(whoami)"
echo "==========================================================="
echo

# -----------------------------------------------------------
echo "SYSTEM INFORMATION"
echo "-----------------------------------------------------------"

echo "Operating System : $(grep PRETTY_NAME /etc/os-release | cut -d= -f2 | tr -d '"')"
echo "Kernel Version   : $(uname -r)"
echo "System Uptime    : $(uptime -p)"

echo

# -----------------------------------------------------------
echo "ALL USERS"
echo "-----------------------------------------------------------"

printf "%-20s %-10s %-30s\n" "USERNAME" "UID" "HOME DIRECTORY"

awk -F: '{printf "%-20s %-10s %-30s\n",$1,$3,$6}' /etc/passwd

echo
echo "Total Users : $(wc -l < /etc/passwd)"

echo

# -----------------------------------------------------------
echo "LOGGED-IN USERS"
echo "-----------------------------------------------------------"

who

echo

# -----------------------------------------------------------
echo "LAST LOGIN HISTORY"
echo "-----------------------------------------------------------"

last -a | head -10

echo

# -----------------------------------------------------------
echo "GROUP INFORMATION"
echo "-----------------------------------------------------------"

cut -d: -f1 /etc/group

echo

# -----------------------------------------------------------
echo "USER GROUP MEMBERSHIP"
echo "-----------------------------------------------------------"

for user in $(cut -d: -f1 /etc/passwd)
do
    echo
    echo "$user"
    groups "$user" 2>/dev/null
done

echo

# -----------------------------------------------------------
echo "HOME DIRECTORY STATUS"
echo "-----------------------------------------------------------"

for home in /home/*
do

    if [ -d "$home" ]
    then
        printf "%-35s Available\n" "$home"
    fi

done

echo

# -----------------------------------------------------------
echo "PROJECT DIRECTORY PERMISSIONS"
echo "-----------------------------------------------------------"

ls -ld \
/company-app/app \
/company-app/scripts \
/company-app/backups \
/company-app/logs \
/company-app/shared 2>/dev/null

echo

# -----------------------------------------------------------
echo "PROJECT USERS"

echo "-----------------------------------------------------------"

for USER in developer1 developer2 developer3 devops1
do

    if id "$USER" &>/dev/null
    then
        echo "$USER : EXISTS"
    else
        echo "$USER : NOT FOUND"
    fi

done

echo

# -----------------------------------------------------------
echo "REPORT SUMMARY"
echo "-----------------------------------------------------------"

echo "Developer Group Members :"
getent group developers | cut -d: -f4

echo

echo "DevOps Group Members :"
getent group devops | cut -d: -f4

echo

echo "==========================================================="
echo "REPORT GENERATED SUCCESSFULLY"
echo "==========================================================="

} > "$REPORT_FILE"

echo "User report generated successfully."
echo "Location : $REPORT_FILE"

exit 0
