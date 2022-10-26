#!/bin/bash
set -e

if ! id -u $FTP_USER > /dev/null 2>&1; then
	useradd $FTP_USER -d /var/www/html/wordpress -s /bin/bash -G www-data
	echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd
	echo $FTP_USER | tee -a /etc/vsftpd.userlist > /dev/null 2>&1
	chown -R www-data:www-data /var/www/html/wordpress
fi

service vsftpd start
service vsftpd stop

echo "*****Starting FTP Container*****"

exec "$@"