FROM debian:buster

# 環境変数の設定
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

# 必要なパッケージのインストールとtiniの追加
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
    mariadb-client \
    && apt-get install -y tini

# PHPの設定ファイルのコピー
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

# WP-CLIのインストール
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

# WordPressのセットアップスクリプトのコピーと設定
COPY ./tools/setup_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_wordpress.sh
RUN mkdir -p /run/php/

# 作業ディレクトリの設定
WORKDIR /var/www/html

# ポート9000を公開
EXPOSE 9000

# tiniをエントリーポイントとして設定し、WordPressのセットアップスクリプトを実行
ENTRYPOINT ["/usr/bin/tini", "--", "setup_wordpress.sh"]

