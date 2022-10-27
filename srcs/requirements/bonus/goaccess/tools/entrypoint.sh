#!/bin/bash
set -e

# waiting for log file
while [ ! -f /var/log/nginx/wordpress_access.log ]; do
	echo "Waiting for Log File ..."
    sleep 1
done

mkdir -p /var/www/html/wordpress/goaccess
cd /var/log/nginx/
goaccess -f wordpress_access.log -a > /var/www/html/wordpress/goaccess/index.html
chown -R www-data:www-data /var/www/html/wordpress

# create the PID file(/run/php/php7.3-fpm.pid)
service php7.3-fpm start
service php7.3-fpm stop

echo "*****Starting GoAccess Container*****"

exec "$@"