#!/bin/sh
set -e

sed -i s/'{$DOMAIN_NAME}'/$DOMAIN_NAME/g /etc/nginx/sites-available/default

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
	openssl req -x509 -newkey rsa:4096 -sha256 -days 3650 -nodes \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt \
		-subj "/C=KR/ST=Seoul/L=Seoul/O=wordpress/CN=$DOMAIN_NAME";
fi

echo "*****Starting Nginx Container*****"

exec "$@"