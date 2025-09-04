FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

COPY tools/setup.sh /

RUN mkdir /run/mysqld

RUN chmod +x /setup.sh

ENTRYPOINT ["/setup.sh"]
