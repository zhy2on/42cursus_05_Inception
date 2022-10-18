FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx

COPY ./conf/nginx.conf /etc/nginx/sites-available/default
COPY ./tools/create_ssl.sh /tmp/

RUN apt-get install -y openssl && \
	chmod +x /tmp/create_ssl.sh

ENTRYPOINT [ "/tmp/create_ssl.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]