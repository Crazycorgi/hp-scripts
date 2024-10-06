# Lock root account
passwd -l root

# Change ssh config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "AllowUsers hkeating ubuntu" >> /etc/ssh/sshd_confi


apt install ufw -y
ufw deny 4444
# mysql
ufw allow 3306
ufw allow 33060
ufw allow OpenSSH


echo "Removing nopasswdlogon group"
sed -i -e '/nopasswdlogin/d' /etc/group


apt update -y
apt install ranger -y
apt install fail2ban -y
apt install tmux -y
apt install curl -y
apt install whowatch -y


wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x pspy64

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

pwck

chattr +i /etc/ssh/sshd_config
ufw enable
