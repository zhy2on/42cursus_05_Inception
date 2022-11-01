#!/bin/bash
set -e

# waiting for log file
while [ ! -f /var/log/nginx/wordpress_access.log ]; do
	echo "Waiting for Log File ..."
    sleep 1
done

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=goaccess/CN=$DOMAIN_NAME";
fi

# create nginx log report page
mkdir -p /var/www/html/wordpress/goaccess
goaccess \
		-f /var/log/nginx/wordpress_access.log \
		-o /var/www/html/wordpress/goaccess/index.html \
		--ssl-cert=/etc/ssl/certs/nginx.crt \
		--ssl-key=/etc/ssl/private/nginx.key \
		--real-time-html --daemonize
chown -R www-data:www-data /var/www/html/wordpress

echo "*****Starting GoAccess Container*****"

exec "$@"