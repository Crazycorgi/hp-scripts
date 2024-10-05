#!/bin/bash

# Check for remote server path argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <remote_backup_path>"
    exit 1
fi

# Variables
LOCAL_BACKUP_DIR="$HOME/.backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BIN_BACKUP="$LOCAL_BACKUP_DIR/bin_backup_$TIMESTAMP.tar.gz"
HOME_BACKUP="$LOCAL_BACKUP_DIR/home_backup_$TIMESTAMP.tar.gz"
REMOTE_USER="plinktern"  # Replace with your remote server username
REMOTE_HOST="your.server.com"  # Replace with your remote server address
REMOTE_DIR="$1"  # Use the first argument as the remote backup directory

# Create the local backup directory if it doesn't exist
mkdir -p "$LOCAL_BACKUP_DIR"

# Backup /bin directory
echo "Backing up /bin directory..."
tar -czf "$BIN_BACKUP" /bin

# Backup home directory
echo "Backing up home directory..."
tar -czf "$HOME_BACKUP" "$HOME"

# Sync backups to the remote server
echo "Syncing backups to remote server..."
rsync -avz "$LOCAL_BACKUP_DIR/" "$REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR/"

# Print completion message
echo "Backup completed successfully!"

