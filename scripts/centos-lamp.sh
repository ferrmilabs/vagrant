#!/usr/bin/env bash

# Update CentOS with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen

#Apache
yum install -y httpd httpd-devel httpd-tools
systemctl enable httpd
systemctl stop httpd

rm -rf /var/www/html
ln -s /vagrant /var/www/html
chcon -R -t httpd_sys_content_t /vagrant

systemctl start httpd

#php
yum install -y php php-cli php-common php-devel php-mysql

#mysql
yum install -y mysql mysql-devel mariadb-server
systemctl enable mariadb
systemctl start mariadb

mysql -u root -e "SHOW DATABASES";

# Download Starter Content


systemctl restart httpd
