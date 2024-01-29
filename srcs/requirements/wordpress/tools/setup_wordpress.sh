#!/bin/sh
if [ -f ./wordpress/wp-config.php ]; then
    echo "wordpress already downloaded"
else
    wp core download --allow-root --locale=ja --force
    sleep 5

    #wp core config --allow-root --dbname=wordpress --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306
cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
sed -i "s/database_name_here/${DB_NAME}/g" ./wp-config.php
sed -i "s/username_here/${DB_USER}/g" ./wp-config.php
sed -i "s/password_here/${DB_PASSWORD}/g" ./wp-config.php
sed -i "s/localhost/${DB_HOST}/g" ./wp-config.php
sed -i "s/define('DB_CHARSET', 'utf8');/define('DB_CHARSET', 'utf8mb4');/" ./wp-config.php


    wp core install --allow-root --url='yuikeda.42.fr' --title='WordPress for Inception' --admin_user=master --admin_password=master --admin_email="admin@admin.fr"
    wp user create --allow-root yuikeda user2@user.com --user_pass=1234567890 --role=author
fi

php-fpm7.3 --nodaemonize

