FROM debian:buster

RUN apt-get update && \
	apt-get install -y mariadb-server

EXPOSE 3306

COPY ./conf/db-config.sql /tmp/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "mysqld" ]