#!/bin/bash

# create a folder to serve wordpress website from
mkdir -p /var/www/html

cd /var/www/html

rm -rf *

#install wp-cli and make it executable from any working directory
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
chmod +x wp-cli.phar

./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$db_name --dbuser=$db_user --dbpass=$db_user_pass --dbhost=mariadb:3306 --allow-root
./wp-cli.phar user create $wp_user $wp_user_email --user_pass=$wp_user_pass --allow-root
./wp-cli.phar core install --url=$ip_addr --title=INCEPTION --admin_user=$wp_admin --admin_password=$wp_admin_pass --admin_email=$wp_admin_email --allow-root

php-fpm8.4 -F
