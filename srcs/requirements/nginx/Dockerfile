FROM debian:buster

EXPOSE 443

RUN apt-get update && apt-get install -y nginx dumb-init openssl

RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt \
    -subj "/C=US/ST=California/L=San Francisco/O=My Company Ltd/OU=My Department/CN=localhost"

COPY conf/default.conf /etc/nginx/sites-available/default

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]