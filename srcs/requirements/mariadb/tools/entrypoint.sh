#!/bin/sh
set -e

service mysql start

sed -i s/'{$WP_DB_NAME}'/$WP_DB_NAME/g /tmp/set_db.sql
sed -i s/'{$WP_ADMIN}'/$WP_ADMIN/g /tmp/set_db.sql
sed -i s/'{$WP_ADMIN_PASSWORD}'/$WP_ADMIN_PASSWORD/g /tmp/set_db.sql

mariadb < /tmp/set_db.sql

exec "$@"