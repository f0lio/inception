FROM debian:buster
EXPOSE 80 443

RUN apt-get update && apt-get install -y nginx
RUN apt-get install -y vim

COPY conf/default.conf /etc/nginx/sites-available/default
CMD ["nginx", "-g", "daemon off;"]