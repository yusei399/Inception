all: start

# 起動
start:  make-volume-dir
	docker compose -f ./srcs/docker-compose.yml up -d

# 停止
stop:
	docker compose -f ./srcs/docker-compose.yml stop

# 再ビルド
re: rebuild
rebuild: down build start

down:
	docker compose -f srcs/docker-compose.yml down

clean:
	docker compose -f srcs/docker-compose.yml down --volumes
	sudo rm -rf /home/yuikeda/data

make-volume-dir:
	sudo mkdir -p /home/yuikeda/data/wordpress
	sudo mkdir -p /home/yuikeda/data/mysql

remove-volume:
	sudo rm -rf /home/yuikeda/data/mysql/* /home/yuikeda/data/wordpress/*

build:
	- docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	- docker compose -f ./srcs/docker-compose.yml build --no-cache

.PHONY: all start stop rebuild  make-volume-dir remove  n-volume build re

#  https://localhost/wp-admin
