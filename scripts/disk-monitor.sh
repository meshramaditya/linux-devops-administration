#!/bin/bash

# ==========================================================
# Project : Linux DevOps Administration & Automation on AWS
# Script  : disk-monitor.sh
# Purpose : Monitor disk usage and generate alerts
# ==========================================================

# -----------------------------
# Configuration
# -----------------------------
THRESHOLD=80
PARTITION="/"

LOG_DIR="/company-app/logs"
LOG_FILE="$LOG_DIR/disk-monitor.log"

mkdir -p "$LOG_DIR"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# -----------------------------
# Get Disk Usage
# -----------------------------
USAGE=$(df -h "$PARTITION" | awk 'NR==2 {gsub("%",""); print $5}')

# -----------------------------
# Logging Function
# -----------------------------
log() {
    echo "[$TIMESTAMP] $1" >> "$LOG_FILE"
}

log "INFO     : Disk usage check initiated."
log "USAGE    : ${USAGE}%"

# -----------------------------
# Compare Usage
# -----------------------------
if [ "$USAGE" -ge "$THRESHOLD" ]; then

    log "WARNING  : Disk usage exceeded configured threshold (${THRESHOLD}%)."
    log "ACTION   : Administrator should review large files and clean unnecessary data."

    # Show top largest directories
    log "Largest Directories:"
    du -sh /company-app/* 2>/dev/null | sort -hr >> "$LOG_FILE"

else

    log "STATUS   : Disk usage is within the normal range."

fi

log "-----------------------------------------------------------"

exit 0
