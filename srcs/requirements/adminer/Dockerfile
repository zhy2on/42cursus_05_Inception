FROM debian:buster

RUN apt-get update && \
	apt-get install -y php7.3 php7.3-mysqli wget

RUN mkdir -p /var/www/html/adminer && \
	wget "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php" \
	-O /var/www/html/adminer/index.php

EXPOSE 8000

COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "php7.3" , "-S", "0.0.0.0:8000" ]