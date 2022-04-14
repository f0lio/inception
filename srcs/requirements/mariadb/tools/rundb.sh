#!/bin/sh

sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

if [ -z "$(mysql -u root -e "SHOW DATABASES LIKE '${WP_DB_NAME}'" | grep ${WP_DB_NAME})" ]; then
    echo "Creating database ${WP_DB_NAME}"
    mysql -u root -p${DB_ROOT_PASSWORD} -e "\
    CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
    GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.* TO '${WP_DB_USER}'@'%' IDENTIFIED BY '${WP_DB_PASSWORD}';
    FLUSH PRIVILEGES;
    "
fi