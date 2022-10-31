FROM debian:buster

RUN apt-get update && \
	apt-get install -y \
		libncursesw5-dev libgeoip-dev libtokyocabinet-dev build-essential \
		wget make lighttpd dumb-init

RUN wget http://tar.goaccess.io/goaccess-1.4.tar.gz && \
	tar -xzvf goaccess-1.4.tar.gz && cd goaccess-1.4/ && \
	./configure --enable-utf8 --enable-geoip=legacy && make && make install && \
	goaccess --dcf

EXPOSE 7890

COPY ./conf/goaccess.conf /usr/local/etc/goaccess/
COPY ./conf/lighttpd.conf /etc/lighttpd/lighttpd.conf
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD [ "bash", "-c", "/tmp/entrypoint.sh && lighttpd -f /etc/lighttpd/lighttpd.conf -D" ]