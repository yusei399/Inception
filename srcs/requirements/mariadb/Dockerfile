FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY  ./requirements/mariadb/conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./requirements/mariadb/tools/setup.sh ./
RUN chmod +x setup.sh
RUN ./setup.sh

#RUN service mysql start && mysql -u root -p${MYSQL_ROOT_PASSWORD} < init.sql

CMD ["mysqld_safe"]

