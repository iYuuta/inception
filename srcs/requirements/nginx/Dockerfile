FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl/

RUN mkdir -p /var/log/nginx

RUN mkdir -p /var/www/html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/server.key -out /etc/nginx/ssl/server.crt -subj "/C=MA/ST=NONE/L=NONE/O=NONE/OU=Unit/CN=yoayedde.42.fr"

COPY tools/default.conf /etc/nginx/sites-enabled/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]