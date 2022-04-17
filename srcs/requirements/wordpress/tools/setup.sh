#!/bin/sh

until mysqladmin ping -h"${DB_HOSTNAME}" -u"root" -p"${DB_ROOT_PASSWORD}" --silent; do
    echo "Waiting for mariadb to be ready..."
    sleep 1
done

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i 's/database_name_here/'${WP_DB_NAME}'/g' /var/www/wordpress/wp-config.php
    sed -i 's/username_here/'${WP_ADMIN_USER_NAME}'/g' /var/www/wordpress/wp-config.php
    sed -i 's/password_here/'${WP_ADMIN_USER_PASSWORD}'/g' /var/www/wordpress/wp-config.php
    sed -i 's/localhost/'${DB_HOSTNAME}'/g' /var/www/wordpress/wp-config.php
fi

service php7.3-fpm start # for creating config directory
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

php-fpm7.3 -F -R