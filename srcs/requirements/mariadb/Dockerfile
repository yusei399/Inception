FROM debian:buster

RUN apt-get update \
    && apt-get install -y mariadb-server procps  ;
EXPOSE 3306
COPY ./tools/setup_mariadb.sh /usr/local/bin/
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
RUN chmod +x /usr/local/bin/setup_mariadb.sh
ENTRYPOINT ["sh","/usr/local/bin/setup_mariadb.sh"]
