#!/bin/bash
if [ ! -d "/var/lib/mysql/wordpress" ]; then

    mysql_install_db
    service mysql start

    # ユーザーとデータベースを作成し、utf8mb4文字セットを指定
    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&
    mysql -e "CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" &&
    mysql -e "GRANT ALL PRIVILEGES ON wordpress.* TO '${MYSQL_USER}'@'localhost';" &&
    mysql -e "FLUSH PRIVILEGES;"

    mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"
    service mysql stop
fi
mysqld_safe --bind-address=0.0.0.0

