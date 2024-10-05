#!/bin/bash

# Define the new password
new_password="showdown rival treestump free"

# Loop through all user accounts in /etc/passwd
while IFS=: read -r username _; do
    # Skip system accounts (usually those with UID below 1000)
    uid=$(id -u "$username")
    if [ "$uid" -ge 1000 ]; then
        echo "Changing password for user: $username"
        # Change the password to IMAKNIGHT using chpasswd
        echo "$username:$new_password" | chpasswd
    fi
done < /etc/passwd

echo "Password change process completed."

