#!/bin/sh

sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

if [ -z "$(mysql -u root -e "SHOW DATABASES LIKE '${WP_DB_NAME}'" | grep ${WP_DB_NAME})" ]; then
    
    echo "Creating database ${WP_DB_NAME}"
    mysql -u root -e "CREATE DATABASE ${WP_DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;"
    mysql -u root ${WP_DB_NAME} < /tmp/wp-db.sql
    
    mysql -u root -e "\
    GRANT ALL PRIVILEGES ON ${WP_DB_NAME}.*\
     TO '${WP_ADMIN_USER_NAME}'@'%' IDENTIFIED BY '${WP_ADMIN_USER_PASSWORD}';
    
    GRANT SELECT ON ${WP_DB_NAME}.*\
     TO '${WP_USER_NAME}'@'%' IDENTIFIED BY '${WP_USER_PASSWORD}';

    FLUSH PRIVILEGES;
    "
    mysql -u root -e "\
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;"
fi

mysqladmin -u root -p$DB_ROOT_PASSWORD shutdown
mysqld

# mysqld_safe
