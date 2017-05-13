#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# 1. Create user
adduser {username}

# 2. Prepare HOME directory (With Root)
chown root:root /home/{username}
mkdir /home/{username}/app
chmod -R 755 /home/{username}/app
mkdir /home/{username}/app/.ssh
chmod -R 600 /home/{username}/app/.ssh
touch /home/{username}/app/.ssh/authorized_keys
chmod -R 400 /home/{username}/app/.ssh/authorized_keys
chown -R {username}:{username} /home/{username}/app

# 3. Change HOME directory in /etc/passwd (With Root)
nano /etc/passwd
/home/{username}/app

# 4. Add configuration in /etc/ssh/sshd_config (With Root)
nano /etc/ssh/sshd_config

Match User {username}
	ChrootDirectory /home/{username}
	AllowTCPForwarding no
	# X11Forwarding no
	ForceCommand internal-sftp
	PasswordAuthentication no

# 5. Restart the server (With Root)
service sshd restart