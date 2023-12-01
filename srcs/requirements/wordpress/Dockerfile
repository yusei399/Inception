FROM debian
ENV TERM=xterm
RUN apt-get update && apt-get -y install \
    apt-utils \
    dialog \
    wget \
    php7.4 \
    php7.4-cgi \
    php7.4-mysql \
    php7.4-fpm \
    php7.4-pdo \
    php7.4-gd \
    php7.4-cli \
    php7.4-mbstring \
    curl \
    mariadb-client
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wordpress.sh
RUN mkdir -p /run/php/
WORKDIR /var/www/html
EXPOSE 9000
ENV TZ Asia/Tokyo
ENTRYPOINT ["setup_wordpress.sh"]
