FROM	debian:buster

ENV		AUTOINDEX on

RUN		apt-get update
RUN		apt-get -y install nginx
RUN		apt-get -y install mariadb-server
RUN		apt-get -y install php7.3-fpm php7.3-mysql

COPY	srcs/ srcs/
CMD		bash srcs/config.sh

EXPOSE	80
EXPOSE	443