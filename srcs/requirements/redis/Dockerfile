FROM debian:buster

RUN apt-get update && \
	apt-get install -y redis-server php7.3-redis

EXPOSE 6379

COPY ./conf/redis.conf /etc/redis/
COPY ./tools/entrypoint.sh /tmp/

RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT [ "/tmp/entrypoint.sh" ]

CMD [ "redis-server", "/etc/redis/redis.conf" ]