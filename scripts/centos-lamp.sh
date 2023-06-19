#!/usr/bin/env bash

# Update CentOS with any patches
yum update -y --exclude=kernel

#Tools
yum install -y nano git unzip screen wget

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
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/ferrmilabs/vagrant/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/ferrmilabs/vagrant/main/files/info.php



systemctl restart httpd
