if [ ! -d "/var/lib/mysql/wordpress" ]; then

    mysql_install_db
    service mysql start


    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' identified by '${MYSQL_PASSWORD}';" &&
        mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&
	mysql -e "CREATE DATABASE IF NOT EXISTS wordpress CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;" &&
        mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&
        mysql -e "FLUSH PRIVILEGES;"

    mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"
    service mysql stop
fi
mysqld_safe --bind-address=0.0.0.0

