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
echo -e "\n ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo -e "\nWrite the name of the database"
read database
echo -e "\nUser database (Default root)"
read user
echo -e "\nPath to create the file (Default /root/)"
read path

if [ -z "$user"]; then
	user="root"
fi

if [ -z "$path"]; then
	path="/root/"
fi

echo -e "\nStart backup ..."
echo -e "Database:\t\t\t$database"
echo -e "User:\t\t\t\t$user"
echo -e "Path:\t\t\t\t$path"

# MySQL
mysqldump --user $user --password --default-character-set=utf8 --events --routines $database | sed -e 's/DEFINER[ ]*=[ ]*[^*]*\*/\*/' > $path$database$DATE.sql
sed -i "1i DROP SCHEMA IF EXISTS $database;\nCREATE SCHEMA $database;\nUSE $database;" $path$database$DATE.sql

echo -e "\nBackup:\t$path$database$DATE.sql"
echo "S U C C E S S!"