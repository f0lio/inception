FROM debian:buster

EXPOSE 3306

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client dumb-init
RUN apt-get install -y vim

# RUN mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
# RUN mysql_secure_installation 

COPY tools/rundb.sh /usr/local/bin/rundb.sh
COPY db/wp-db.sql /tmp/wp-db.sql

# HEALTHCHECK CMD curl --fail http://localhost:3000 || exit 1

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["/bin/sh", "/usr/local/bin/rundb.sh"]
