#!/bin/bash
set -e

cd /var/www/html/adminer/

echo "*****Starting Adminer Container*****"

exec "$@"