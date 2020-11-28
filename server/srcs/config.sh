service mysql start
service php7.3-fpm start

rm /etc/nginx/sites-available/default #Borra antigua cfg
cp srcs/default /etc/nginx/sites-available/ #Copia default cfg actualizada
cp srcs/manu /etc/nginx/sites-available/ #Copia cfg de servidor manu
ln -s /etc/nginx/sites-available/manu /etc/nginx/sites-enabled/ #Crea link a sites-enabled
mkdir /var/www/manu #Crea carpeta de servidor MANU
cp -r srcs/phpmyadmin /var/www/manu/ #Copia phpmyadmin a servidor manu

openssl req -new -newkey rsa:2048 -nodes -out manu.csr -keyout manu.key -subj "/C=ES/ST=Spain/L=Madrid/O=42Madrid/OU=dev/CN=manu"
mkdir /etc/nginx/certs/
mkdir /etc/nginx/certs/manu
mv ./manu.key etc/nginx/certs/manu/
mv ./manu.csr etc/nginx/certs/manu/

mysql -u root -p -e "CREATE DATABASE admins;"
mysql -u root -p -e "GRANT ALL PRIVILEGES ON admins.* TO 'manu'@'localhost' IDENTIFIED BY 'hola';"
mysql -u root -p -e "FLUSH PRIVILEGES;"

service nginx start

/bin/bash