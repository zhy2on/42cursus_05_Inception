FROM debian:buster

RUN apt-get update && \
	apt-get install -y nodejs git dumb-init && \
	git clone https://github.com/zhy2on/simple-static-web

EXPOSE 3000

COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "/tmp/entrypoint.sh" ]

CMD [ "node", "/simple-static-web/index.js" ]