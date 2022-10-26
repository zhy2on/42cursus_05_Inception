#!/bin/bash
set -e

if ! id -u $FTP_USER > /dev/null 2>&1; then
	useradd $FTP_USER -d /var/www/html/wordpress -s /usr/sbin/nologin
	echo "$FTP_USER:$FTP_USER_PASSWORD" | chpasswd
fi

echo "$FTP_USER" | tee -a /etc/vsftpd.userlist > /dev/null 2>&1

chown -R $FTP_USER:$FTP_USER /var/www/html/wordpress

echo "*****Starting FTP Container*****"

exec "$@"