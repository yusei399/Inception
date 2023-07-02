FROM debian:buster 
#FROM maradb:latest
RUN apt-get update && apt-get install -y mariadb-server
EXPOSE 3306

COPY ./tools/setup.sh /usr/local/bin/
ENV  MYSQL_ROOT_PASSWORD={MYSQL_ROOT_PASSWORD} 
RUN chmod +x /usr/local/bin/setup.sh
VOLUME [ "sh","/usr/local/bin/setup.sh" ]
