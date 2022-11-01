FROM debian:buster

RUN apt-get update && \
	apt -y install lsb-release apt-transport-https ca-certificates wget && \
	wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
	echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt-get update && apt-get install -y php8.1-fpm php8.1-mysqli wget dumb-init && \
	mkdir -p /var/www/html/wordpress/adminer && cd /var/www/html/wordpress/adminer && \
	wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
	-O /var/www/html/wordpress/adminer/index.php

EXPOSE 8000

COPY ./conf/www.conf /etc/php/8.1/fpm/pool.d/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "/tmp/entrypoint.sh" ]

CMD [ "php-fpm8.1", "-F" ]