FROM debian:buster

RUN apt-get update && \
	apt-get install -y vsftpd dumb-init

EXPOSE 20 21

COPY ./conf/vsftpd.conf /etc/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "/tmp/entrypoint.sh" ]

CMD [ "vsftpd" ]