FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
		libncursesw5-dev libgeoip-dev libtokyocabinet-dev build-essential \
		wget make php7.3-fpm

RUN wget http://tar.goaccess.io/goaccess-1.4.tar.gz && \
	tar -xzvf goaccess-1.4.tar.gz && cd goaccess-1.4/ && \
	./configure --enable-utf8 --enable-geoip=legacy && make && make install && \
	goaccess --dcf

EXPOSE 7890

COPY ./conf/goaccess.conf /usr/local/etc/goaccess/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "php-fpm7.3", "-F" ]