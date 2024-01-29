FROM debian:buster

ENV TERM=xterm
ENV DB_NAME=wordpress
ENV DB_USER=hogehoge
ENV DB_PASSWORD=new1234
ENV DB_HOST=mariadb:3306
ENV WP_URL=http://yuikeda.42.fr
ENV WP_TITLE=Inception
ENV WP_ADMIN=master
ENV WP_ADMIN_PASSWORD=master
ENV WP_ADMIN_EMAIL=admin@admin.fr
ENV TZ=Asia/Tokyo

RUN apt-get update && apt-get -y install \
    apt-utils \
    dialog \
    wget \
    php7.3 \
    php7.3-cgi \
    php7.3-mysql \
    php7.3-fpm \
    php7.3-pdo \
    php7.3-gd \
    php7.3-cli \
    php7.3-mbstring \
    curl \
    mariadb-client

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wordpress.sh
RUN mkdir -p /run/php/

WORKDIR /var/www/html
EXPOSE 9000

#RUN cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
#RUN cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
#RUN sed -i "s/database_name_here/${DB_NAME}/g" /var/www/html/wp-config.php
#RUN sed -i "s/username_here/${DB_USER}/g" /var/www/html/wp-config.php
#RUN sed -i "s/password_here/${DB_PASSWORD}/g" /var/www/html/wp-config.php
#RUN sed -i "s/localhost/${DB_HOST}/g" /var/www/html/wp-config.php


ENTRYPOINT ["setup_wordpress.sh"]

