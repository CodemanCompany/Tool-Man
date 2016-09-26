#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# Basic
rm -rf {file}
chmod -R 755 {directory}
chown -R {user}:{user} {directory}

# Download file
curl {URL} > {output}

# Compress
zip -r {file}.zip {path}
unzip {file}.zip

# Remove directory
rm -rf directory

# Create user

# --------------------------------------------------------------
# Hostname
# --------------------------------------------------------------
# Change
echo "codeman" >> /etc/hosts
hostname {codeman}

# Show
hostname
# --------------------------------------------------------------

# Show
hostname

# Last command
npm install -g sass
sudo !!

# --------------------------------------------------------------
# Write to file
# --------------------------------------------------------------
# Overwrite
echo "test" > {file}

# Push
echo "test" >> {file}

# Clean
> {file}
# --------------------------------------------------------------

# --------------------------------------------------------------
# MySQL remote
# --------------------------------------------------------------
# Add in my.cnf
skip-external-locking
bind-address	=	{ip}|0.0.0.0

# Add in console MySQL
GRANT ALL PRIVILEGES ON *.* TO root@'%' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;
# --------------------------------------------------------------

# --------------------------------------------------------------
# Storage
# --------------------------------------------------------------
# Disk capacity
df -h

# List files with size
ls -lh

# Folder size (Summary)
du -h

# Folder size
du -sh
du -sh {directory}
# --------------------------------------------------------------