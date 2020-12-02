service mysql start
service php7.3-fpm start

rm /etc/nginx/sites-available/default
cp srcs/default /etc/nginx/sites-available/
cp srcs/manu /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/manu /etc/nginx/sites-enabled/
mkdir /var/www/manu
cp -r srcs/phpmyadmin /var/www/manu/

wget https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
mv wordpress /var/www/manu/
rm -rf /latest.tar.gz
chown -R www-data:www-data /var/www/manu/*
cp srcs/wp-config.php var/www/manu/wordpress/

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/manu.key -out /etc/ssl/certs/manu.crt -subj "/C=ES/ST=Spain/L=Madrid/O=42Madrid/OU=42/CN=127.0.0.1"
chmod 700 /etc/ssl/private

mysql -u root -p=hola -e "CREATE DATABASE admins;"
mysql -u root -p=hola -e "GRANT ALL PRIVILEGES ON admins.* TO 'manu'@'localhost' IDENTIFIED BY 'hola';"
mysql -u root -p=hola -e "FLUSH PRIVILEGES;"

mysql -u root -p=hola -e "CREATE DATABASE wordpress;"
mysql -u root -p=hola -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'manu'@'localhost' IDENTIFIED BY 'hola';"
mysql -u root -p=hola -e "FLUSH PRIVILEGES;"

service nginx start

rm -rf /srcs

/bin/bash