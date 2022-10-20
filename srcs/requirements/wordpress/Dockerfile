FROM debian:buster

RUN apt-get update && \
	apt-get install -y php7.3-fpm php7.3-mysql mariadb-client curl && \
	curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp && \
	chmod +x /usr/local/bin/wp && \
	mkdir -p /var/www/html/wordpress

EXPOSE 9000

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh" ]

CMD [ "service", "php7.3-fpm", "start" ]