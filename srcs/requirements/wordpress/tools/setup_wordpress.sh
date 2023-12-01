#!/bin/sh
if [ -f ./wordpress/wp-config.php ]; then
    echo "wordpress already downloaded"
else
    wp core download --allow-root --locale=ja --force
    sleep 5
    wp core config --allow-root --dbname=wordpress --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --dbhost=mariadb:3306
    wp core install --allow-root --url='yuikeda.42.fr' --title='WordPress for Inception' --admin_user=master --admin_password=master --admin_email="admin@admin.fr"
    wp user create --allow-root yuikeda user2@user.com --user_pass=1234567890 --role=author
fi

php-fpm7.4 --nodaemonize
