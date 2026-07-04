#!/bin/bash

# ==========================================================
# Project : Linux DevOps Administration & Automation on AWS
# Script  : app-monitor.sh
# Purpose : Monitor Nginx application and restart if stopped
# ==========================================================

SERVICE_NAME="nginx"

LOG_DIR="/company-app/logs"
MONITOR_LOG="$LOG_DIR/app-monitor.log"
ALERT_LOG="$LOG_DIR/app-alert.log"

mkdir -p "$LOG_DIR"

timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# ----------------------------------------------------------
# Logging Functions
# ----------------------------------------------------------

log_monitor() {
    echo "[$timestamp] $1" >> "$MONITOR_LOG"
}

log_alert() {
    echo "[$timestamp] $1" >> "$ALERT_LOG"
}

# ----------------------------------------------------------
# Check Service Status
# ----------------------------------------------------------

if systemctl is-active --quiet "$SERVICE_NAME"
then

    log_monitor "INFO     : Health check initiated."
    log_monitor "STATUS   : $SERVICE_NAME service is running."

else

    log_monitor "WARNING  : $SERVICE_NAME service is NOT running."
    log_monitor "ACTION   : Attempting automatic restart..."

    log_alert "ALERT    : $SERVICE_NAME service is DOWN."
    log_alert "ACTION   : Automatic restart initiated."

    systemctl restart "$SERVICE_NAME"

    sleep 2

    if systemctl is-active --quiet "$SERVICE_NAME"
    then

        log_monitor "SUCCESS  : $SERVICE_NAME restarted successfully."

        log_alert "STATUS   : Restart completed successfully."
        log_alert "RESULT   : Service restored successfully."

    else

        log_monitor "ERROR    : Failed to restart $SERVICE_NAME."

        log_alert "STATUS   : Restart failed."
        log_alert "ACTION   : Manual intervention required."

    fi

fi

log_monitor "-----------------------------------------------------------"
