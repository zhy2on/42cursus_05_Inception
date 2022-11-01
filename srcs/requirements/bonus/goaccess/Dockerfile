FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
		libncursesw5-dev libgeoip-dev libtokyocabinet-dev build-essential \
		openssl libssl-dev wget make nginx dumb-init

RUN wget https://tar.goaccess.io/goaccess-1.6.4.tar.gz && \
	tar -xzvf goaccess-1.6.4.tar.gz && cd goaccess-1.6.4/ && \
	./configure --enable-utf8 --enable-geoip=legacy --with-openssl && make && make install && \
	goaccess --dcf

EXPOSE 7000 7890

COPY ./conf/goaccess.conf /usr/local/etc/goaccess/
COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD [ "bash", "-c", "/tmp/entrypoint.sh && nginx -g 'daemon off;'" ]