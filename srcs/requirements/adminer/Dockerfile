FROM debian:buster

RUN apt-get update && \
	apt-get install -y php7.3-fpm php7.3-mysqli wget && \
	mkdir -p /var/www/html/wordpress/adminer && cd /var/www/html/wordpress/adminer && \
	wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
	-O /var/www/html/wordpress/adminer/index.php

EXPOSE 8000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD ["php-fpm7.3", "-F"]