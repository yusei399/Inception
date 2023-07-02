#!/bin/bash

    mysql_install_db
    service mysql start

    mysql -e "CREATE USER '${MYSQL_USER}'@'localhost' identified by '${MYSQL_PASSWORD}';" &&
        mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;" &&
        mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';" &&
        mysql -e "FLUSH PRIVILEGES;"
    mysqladmin -u root password "${MYSQL_ROOT_PASSWORD}"
    service mysql stop

