FROM debian:buster

RUN apt-get update && apt-get install -y \
	libncursesw5-dev libgeoip-dev libtokyocabinet-dev build-essential \
	wget make nginx dumb-init

RUN wget https://tar.goaccess.io/goaccess-1.6.4.tar.gz && \
	tar -xzvf goaccess-1.6.4.tar.gz && cd goaccess-1.6.4/ && \
	./configure --enable-utf8 --enable-geoip=legacy && make && make install && \
	goaccess --dcf

EXPOSE 7000 7890

COPY ./conf/goaccess.conf /usr/local/etc/goaccess/
COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "/tmp/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]
