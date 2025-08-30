FROM debian:latest

RUN apt update -y && apt upgrade -y &&  apt install -y php php-mysql php-fpm curl

COPY tools/config-fpm /etc/php/8.4/fpm/pool.d/www.conf

COPY tools/install.sh /usr/bin/install.sh

RUN chmod +x /usr/bin/install.sh && install.sh
