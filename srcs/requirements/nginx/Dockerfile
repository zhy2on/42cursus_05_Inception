FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx

EXPOSE 443

COPY ./tools/entrypoint.sh /tmp/
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

RUN apt-get install -y openssl && \
	chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]