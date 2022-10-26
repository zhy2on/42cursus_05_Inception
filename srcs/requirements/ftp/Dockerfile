FROM debian:buster

RUN apt-get update && \
	apt-get install -y vsftpd

EXPOSE 20 21

COPY ./conf/vsftpd.conf /etc/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "vsftpd" ]