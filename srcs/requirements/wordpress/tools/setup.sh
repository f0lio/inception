#!/bin/sh

if [ ! -f /var/www/wordpress/wp-config.php ]; then
    mv /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
    sed -i 's/database_name_here/${WORDPRESS_DB_NAME}/g' /var/www/wordpress/wp-config.php
    sed -i 's/username_here/${WORDPRESS_DB_USER}/g' /var/www/wordpress/wp-config.php
    sed -i 's/password_here/${WORDPRESS_DB_PASSWORD}/g' /var/www/wordpress/wp-config.php
    sed -i 's/localhost/${WORDPRESS_DB_HOST}/g' /var/www/wordpress/wp-config.php
fi

service php7.3-fpm start # for creating config directory
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

php-fpm7.3 -F -R