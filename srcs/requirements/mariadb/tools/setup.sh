#!/bin/bash

cat << yuuta > /etc/mysql/database_init.sql
CREATE DATABASE IF NOT EXISTS $db_name;
CREATE USER IF NOT EXISTS '$db_user'@'%' IDENTIFIED BY '$db_user_pass';
GRANT ALL PRIVILEGES ON $db_name.* TO '$db_user'@'%';
FLUSH PRIVILEGES;
yuuta

exec mysqld --user=root --init-file=/etc/mysql/database_init.sql --bind-address=0.0.0.0
