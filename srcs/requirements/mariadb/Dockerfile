FROM debian:buster

RUN apt-get update && \
    apt-get install -y mariadb-server procps tini

EXPOSE 3306

COPY ./tools/setup_mariadb.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_mariadb.sh

ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}

# tiniをエントリーポイントとして設定し、MariaDBの設定スクリプトを実行
ENTRYPOINT ["/usr/bin/tini", "--", "sh", "/usr/local/bin/setup_mariadb.sh"]

