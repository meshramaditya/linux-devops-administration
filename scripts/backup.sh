#!/bin/bash

# ==========================================================
# Project : Linux DevOps Administration & Automation on AWS
# Script  : backup.sh
# Purpose : Create timestamped backups of the application
# ==========================================================

# ----------------------------
# Variables
# ----------------------------
APP_DIR="/company-app/app"
BACKUP_DIR="/company-app/backups"
LOG_DIR="/company-app/logs"
LOG_FILE="$LOG_DIR/backup.log"

DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_FILE="backup_$DATE.tar.gz"

# ----------------------------
# Ensure Required Directories Exist
# ----------------------------
mkdir -p "$BACKUP_DIR"
mkdir -p "$LOG_DIR"

# ----------------------------
# Logging Function
# ----------------------------
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

log "==========================================================="
log "Backup process started."

# ----------------------------
# Verify Application Directory
# ----------------------------
if [ ! -d "$APP_DIR" ]; then
    log "ERROR: Application directory does not exist."
    log "Backup process aborted."
    exit 1
fi

# ----------------------------
# Create Backup
# ----------------------------
log "Compressing application directory..."

tar -czf "$BACKUP_DIR/$BACKUP_FILE" "$APP_DIR" 2>>"$LOG_FILE"

# ----------------------------
# Verify Backup Creation
# ----------------------------
if [ $? -eq 0 ]; then

    SIZE=$(du -h "$BACKUP_DIR/$BACKUP_FILE" | awk '{print $1}')

    log "SUCCESS: Backup created successfully."
    log "FILE: $BACKUP_FILE"
    log "SIZE: $SIZE"

else

    log "ERROR: Failed to create backup."
    exit 1

fi

# ----------------------------
# Delete Old Backups
# ----------------------------
log "Checking for backups older than 7 days..."

OLD_BACKUPS=$(find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7)

if [ -n "$OLD_BACKUPS" ]; then

    find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -exec rm -f {} \;

    log "Old backups deleted successfully."

else

    log "No old backups found."

fi

# ----------------------------
# Backup Summary
# ----------------------------
TOTAL=$(ls "$BACKUP_DIR"/*.tar.gz 2>/dev/null | wc -l)

log "Total Available Backups : $TOTAL"
log "Backup Location         : $BACKUP_DIR"
log "Backup Status           : SUCCESS"

log "Backup process completed successfully."
log "==========================================================="
echo ""

exit 0
