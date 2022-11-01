#!/bin/bash
set -e

# create the PID file(/run/php/php8.1-fpm.pid)
service php8.1-fpm start
service php8.1-fpm stop

echo "*****Starting Adminer Container*****"

exec "$@"