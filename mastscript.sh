https://help.hackucf.org/guides/OpenStack%20Setup%20Guide/ Lock root account
passwd -l root

# Change ssh config
echo "PermitRootLogin no" >> /etc/ssh/sshd_config
echo "Protocol 2" >> /etc/ssh/sshd_config
echo "AllowUsers hkeating ubuntu" >> /etc/ssh/sshd_confi


apt install ufw -y
ufw deny 4444
ufw allow OpenSSH



apt update -y
apt install ranger -y
apt install fail2ban -y
apt install tmux -y
apt install curl -y
apt install whowatch -y


wget https://github.com/DominicBreuker/pspy/releases/download/v1.2.1/pspy64
chmod +x pspy64


for user in $( sed 's/:.*//' /etc/passwd);
	do
	  if [[ $( id -u $user) -ge 999 && "$user" != "nobody" ]]
	  then
		(echo "showdown rival treestump free"; echo "showdown rival treestump free") |  passwd "$user"
	  fi
done

pwck

chattr +i /etc/ssh/sshd_config

