#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# --------------------------------------------------------------
# Basics
# --------------------------------------------------------------
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

	# Last command
	sudo !!

	# Show users
	cat /etc/passwd

	# Show groups
	cat /etc/group

	# Change timezone
	dpkg-reconfigure tzdata
# --------------------------------------------------------------



# --------------------------------------------------------------
# Create user
# --------------------------------------------------------------
	
# --------------------------------------------------------------

# --------------------------------------------------------------
# DNS
# --------------------------------------------------------------
	whois {domain}

	nslookup [-type=A,MX,NS] {domain}
# --------------------------------------------------------------

# --------------------------------------------------------------
# Hostname
# --------------------------------------------------------------
	# Change
	echo "codeman" >> /etc/hosts
	hostname {codeman}

	# Show
	hostname
# --------------------------------------------------------------



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



# --------------------------------------------------------------
# CPU
# --------------------------------------------------------------
	# Show characteristics
	cat /proc/cpuinfo

	# Show characteristics
	lscpu

	# CPU usage
	ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'
# --------------------------------------------------------------



# --------------------------------------------------------------
# netstat
# --------------------------------------------------------------
# --------------------------------------------------------------



# --------------------------------------------------------------
# NodeJS in Production
# --------------------------------------------------------------
	npm install -g pm2
	pm2 start {script.js}
# --------------------------------------------------------------