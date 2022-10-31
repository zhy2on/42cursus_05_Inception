#!/bin/bash
set -e

# waiting for log file
while [ ! -f /var/log/nginx/wordpress_access.log ]; do
	echo "Waiting for Log File ..."
    sleep 1
done

# create nginx log report page
mkdir -p /var/www/html/wordpress/goaccess
cd /var/log/nginx/
goaccess -f wordpress_access.log -a > /var/www/html/wordpress/goaccess/index.html
chown -R www-data:www-data /var/www/html/wordpress

echo "*****Starting GoAccess Container*****"

exec "$@"