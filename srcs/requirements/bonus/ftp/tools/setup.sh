#!/bin/bash

if id "$ftp_user" > /dev/null 2>&1; then
	exec vsftpd /etc/tools/ftp.conf
else
	useradd -p $(openssl passwd -1 $ftp_user_pass) $ftp_user
	mkdir -p /var/run/vsftpd/empty /home/$ftp_user
	chown $ftp_user /var/www/html
	exec vsftpd /etc/tools/ftp.conf
fi