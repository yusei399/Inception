#!/bin/bash

sed -i 's/MYSQL_DATABASE/wordpress/g' init.sql &&  sed -i 's/MYSQL_USER/wordpress/g' init.sql &&  sed -i 's/MYSQL_PASSWORD/wordpress/g' init.sql &&  sed -i 's/MYSQL_ROOT_PASSWORD/root_pw/g' init.sql
