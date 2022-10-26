FROM debian:buster

RUN apt-get update && \
	apt-get install -y nginx openssl

EXPOSE 443

COPY ./conf/default /etc/nginx/sites-available/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "nginx", "-g", "daemon off;" ]