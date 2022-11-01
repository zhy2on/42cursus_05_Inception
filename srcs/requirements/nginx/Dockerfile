FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl dumb-init

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "/tmp/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]