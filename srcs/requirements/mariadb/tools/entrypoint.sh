#!/bin/sh
set -e

service mysql start

sed -i s/'{$WP_DB_NAME}'/$WP_DB_NAME/g /tmp/db-config.sql
sed -i s/'{$WP_ADMIN}'/$WP_ADMIN/g /tmp/db-config.sql
sed -i s/'{$WP_ADMIN_PASSWORD}'/$WP_ADMIN_PASSWORD/g /tmp/db-config.sql

mariadb < /tmp/db-config.sql

exec "$@"