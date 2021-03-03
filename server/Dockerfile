FROM	debian:buster

ENV		AUTOINDEX on

RUN		apt-get update
RUN		apt-get -y install wget tar unzip
RUN		apt-get -y install nginx
RUN		apt-get -y install mariadb-server
RUN		apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN		apt-get -y install openssl

COPY	srcs/ srcs/
CMD		bash srcs/config.sh

EXPOSE	80
EXPOSE	443