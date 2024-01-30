FROM debian:buster

# tiniをインストール
RUN apt-get update && \
    apt-get install -y nginx openssl tini

# Nginxの設定ファイルをコピー
COPY conf/nginx.conf /etc/nginx/nginx.conf

# ポート443を公開
EXPOSE 443

# タイムゾーン設定
ENV TZ Asia/Tokyo

# SSL証明書を生成
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/yuikeda.42.fr.pem -keyout /etc/ssl/yuikeda.42.fr.key -subj "/C=JP/ST=Tokyo/L=Minato-city /O=42 School/OU=yuikeda/CN=yuikeda.42.fr"

# tiniをエントリーポイントとして設定
ENTRYPOINT ["/usr/bin/tini", "--"]

# Nginxを実行
CMD ["nginx", "-g", "daemon off;"]

