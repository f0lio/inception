FROM debian:buster

EXPOSE 80 443

RUN apt-get update && apt-get install -y nginx dumb-init


COPY conf/default.conf /etc/nginx/sites-available/default

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["nginx", "-g", "daemon off;"]