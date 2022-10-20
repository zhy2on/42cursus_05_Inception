#!/bin/bash
set -e

sed -i s/'{$WP_DB_NAME}'/$WP_DB_NAME/g /var/www/html/wordpress/wp-config.php
sed -i s/'{$WP_ADMIN}'/$WP_ADMIN/g /var/www/html/wordpress/wp-config.php
sed -i s/'{$WP_ADMIN_PASSWORD}'/$WP_ADMIN_PASSWORD/g /var/www/html/wordpress/wp-config.php

wp core download --allow-root
wp config create --dbname=$WP_DB_NAME --dbuser=$WP_ADMIN --dbpass=$WP_ADMIN_PASSWORD --dbhost=mariadb --allow-root
wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root
wp user create $WP_USER $WP_USER_EMAIL --user_pass=$WP_USER_PASSWORD --role=author --allow-root 

chown -R www-data:www-data /var/www/html/wordpress

exec "$@"