#!/bin/bash
set -e

if ! cat /etc/vsftpd.userlist | grep www-data > /dev/null 2>&1; then
	chsh -s /bin/bash www-data
	usermod -d /var/www/html/wordpress www-data
	echo "www-data:$FTP_PASSWORD" | chpasswd
	chown -R www-data:www-data /var/www/html/wordpress
	echo www-data | tee -a /etc/vsftpd.userlist > /dev/null 2>&1
fi

service vsftpd start
service vsftpd stop

echo "*****Starting FTP Container*****"

exec "$@"