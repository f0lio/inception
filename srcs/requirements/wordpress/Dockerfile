FROM debian:buster

EXPOSE 9000

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get install -y php7.3-fpm php7.3-mysql curl dumb-init mariadb-client

RUN curl -o /tmp/wordpress.tar.gz -LO https://wordpress.org/latest.tar.gz \
    && mkdir -p /var/www \
    && tar -xzf /tmp/wordpress.tar.gz -C /var/www && rm /tmp/wordpress.tar.gz \
    && rm -rf /tmp/wordpress.tar.gz 

COPY tools/setup.sh /tmp/setup.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/bin/sh", "/tmp/setup.sh"]
