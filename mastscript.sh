https://help.hackucf.org/guides/OpenStack%20Setup%20Guide/ Lock root account
passwd -l root

# Change ssh config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "AllowUsers hkeating ubuntu" >> /etc/ssh/sshd_confi


apt install ufw -y
ufw deny 4444
ufw allow 3306
ufw allow OpenSSH



apt update -y
apt install ranger -y
apt install fail2ban -y
apt install tmux -y
apt install curl -y
apt install whowatch -y


wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x pspy64

for i in `cat /etc/passwd`; do
	echo -e "'linuxpassword'\n'linuxpassword'" | passwd $i
done


pwck

chattr +i /etc/ssh/sshd_config
ufw enable
