#!/bin/bash
set -e

# waiting for log file
while [ ! -f /var/log/nginx/access.log ]; do
	echo "Waiting for Log File ..."
    sleep 1
done

# create nginx log report page
mkdir -p /var/www/html/wordpress/goaccess
goaccess \
		-f /var/log/nginx/wordpress_access.log \
		-o /var/www/html/wordpress/goaccess/index.html \
		--ws-url=wss://$DOMAIN_NAME/goaccess/ws:443 --port 7890 \
		--tz="UTC/GMT +9" --real-time-html --daemonize
chown -R www-data:www-data /var/www/html/wordpress

echo "*****Starting GoAccess Container*****"

exec "$@"