FROM debian:bookworm

RUN apt update -y && apt upgrade -y && apt install vsftpd -y

COPY tools/ftp.conf /etc/tools/ftp.conf

COPY tools/setup.sh /setup.sh

RUN chmod +x /setup.sh

CMD ["/setup.sh"]
