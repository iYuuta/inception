FROM debian:latest

RUN  apt update -y && apt upgrade -y && apt install -y nginx

COPY tools /var/www/html

COPY f /etc/nginx/sites-available/default

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
