FROM debian:buster

RUN apt-get update && apt-get -y install mariadb-server

EXPOSE 3306

ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
RUN rm -rf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/setup.sh ./
COPY ./tools/init.sql ./
RUN chmod +x setup.sh

CMD ["mysqld_safe"]

