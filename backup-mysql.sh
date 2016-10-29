#!/bin/bash
#  ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
# ██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
# ██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
# ██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝

# Variables
DATE=`date +%Y%m%d%H%M%S`

clear
echo "\n ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo "\nWrite the name of the database"
read database
echo "\nUser database (Default root)"
read user
echo "\nPath to create the file (Default /root/)"
read path

if [ -z "$user"]; then
	user="root"
fi

if [ -z "$path"]; then
	path="/root/"
fi

echo "\nStart backup ..."
echo "Database:\t\t\t$database"
echo "User:\t\t\t\t$user"
echo "Path:\t\t\t\t$path"

# MySQL
mysqldump --user $user --password --default-character-set=utf8 --events --routines $database | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' > $path$database$DATE.sql
sed -i "1i DROP SCHEMA IF EXISTS $database;\nCREATE SCHEMA $database;\nUSE $database;" $path$database$DATE.sql

echo "\nBackup:\t$path$database$DATE.sql"
echo "S U C C E S S!"