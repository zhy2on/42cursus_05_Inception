#!/bin/bash
set -e

# create the PID file(/run/php/php7.3-fpm.pid)
service php7.3-fpm start
service php7.3-fpm stop

echo "*****Starting Adminer Container*****"

exec "$@"