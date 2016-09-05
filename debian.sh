#!/bin/bash

clear
echo "\n ██████╗ ██████╗ ██████╗ ███████╗███╗   ███╗ █████╗ ███╗   ██╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝████╗ ████║██╔══██╗████╗  ██║
██║     ██║   ██║██║  ██║█████╗  ██╔████╔██║███████║██╔██╗ ██║
██║     ██║   ██║██║  ██║██╔══╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
╚██████╗╚██████╔╝██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
 ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝"
echo "\nWhat web server you want to install? (Apache or Nginx)"
read daemon

function base() {
	echo "\nStart\nWeb Server:\t\t\t\t\t$daemon"
	echo "Base configuration\t\t\t\tOK"
	locale-gen UTF-8
	apt-get update
	apt-get upgrade
	apt-get install curl -y
	apt-get install zip -y
}	# end function

function codeman() {
	mkdir /root/Codeman
	rm -rf /var/www/html/*
	rm -rf /etc/apache2/sites-available/*
	rm -rf /etc/apache2/sites-enabled/*
	mkdir /var/www/html/codeman
	mkdir /var/www/html/codeman/api
	mkdir /var/www/html/codeman/app
	mkdir /var/www/html/codeman/page
	chmod -R 755 /var/www/html/
	chown -R root:root /var/www/html/

	curl http://cdn.codeman.company/base-Debian > /root/Codeman/base
	curl http://cdn.codeman.company/Codeman.py > /root/Codeman/Codeman.py
	echo "Configuration Codeman\t\t\t\tOK"
	echo "S U C C E S S!"
}	# end function

if [ "$daemon" == "apache" ] || [ "$daemon" == "Apache" ]; then
	base
	apt-get install apache2 -y
	service apache2 start
	a2enmod expires
	a2enmod headers
	a2enmod rewrite
	echo "ServerTokens Prod" >> /etc/apache2/apache2.conf
	service apache2 restart
	echo "Web server\t\t\t\t\tOK"
	# apt-get install php5-common libapache2-mod-php5 php5-cli -y
	# apt-get install php5-mysql php5-curl -y
	apt-get install php7.0-common libapache2-mod-php7.0 php7.0-cli -y
	apt-get install php7.0-mysql php7.0-curl -y
	service apache2 restart
	echo "PHP\t\t\t\t\t\tOK"
	codeman
elif [ "$daemon" == "nginx" ] || [ "$daemon" == "Nginx" ]; then
	echo "\n*** Not found ***"
	# base
	# apt-get install nginx -y
	# service nginx start
	# echo "Web server\t\t\t\t\tOK"
	# apt-get install php5-fpm -y
	# apt-get install php5-mysql php5-curl -y
	# service php5-fpm restart
	# echo "PHP\t\t\t\t\t\tOK"
	# service nginx restart
	# codeman
else
	echo "\n*** Not found ***"
fi