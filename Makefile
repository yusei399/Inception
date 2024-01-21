MYSQL_DATA_PATH ?= /srcs/yuikeda/data/mysql
WORDPRESS_DATA_PATH ?= /srcs/yuikeda/data/wordpress

all: start

start: make-volume-dir
	MYSQL_DATA_PATH=$(PWD)$(MYSQL_DATA_PATH) WORDPRESS_DATA_PATH=$(PWD)$(WORDPRESS_DATA_PATH) docker compose -f ./srcs/docker-compose.yml up -d
stop:
	docker compose -f ./srcs/docker-compose.yml stop

re: rebuild
rebuild: down build start

down:
	- docker compose -f ./srcs/docker-compose.yml down --volumes --remove-orphans
make-volume-dir:
	sudo mkdir -p $(PWD)$(WORDPRESS_DATA_PATH)
	sudo mkdir -p $(PWD)$(MYSQL_DATA_PATH)

remove-volume:
	sudo rm -rf $(PWD)$(MYSQL_DATA_PATH)/* $(PWD)$(WORDPRESS_DATA_PATH)/*

build:
	- docker compose -f ./srcs/docker-compose.yml down --volumes --rmi all
	- docker compose -f ./srcs/docker-compose.yml build --no-cache

.PHONY: all start stop rebuild make-volume-dir remove-volume build re

#  https://localhost/wp-admin
