#!/bin/bash

# Specify the file to back up and the backup filename
FILE_TO_BACKUP="/var/ftp/ImaHorse.png"
BACKUP_NAME="file_backup_$(date +%F_%H-%M-%S).txt"

# Create a list of unexpected backup locations
BACKUP_LOCATIONS=(
	"/usr/local/share/"
	"/opt/"
	"/var/tmp/"
	"$HOME/.backup/"
	"/etc/"
)

# Create the hidden backup directory if it doesn't exist
mkdir -p "$HOME/.backup/"

# Back up the file to each location
for LOCATION in "${BACKUP_LOCATIONS[@]}"; do
	cp "$FILE_TO_BACKUP" "$LOCATION$BACKUP_NAME"
	echo "Backed up to: $LOCATION$BACKUP_NAME"
done

echo "Backup completed successfully!"

