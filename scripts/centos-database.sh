#!/usr/bin/env bash

#mysql
yum install -y mysql mysql-devel mariadb-server
systemctl enable mariadb
systemctl start mariadb

mysql -u root -e "SHOW DATABASES";
