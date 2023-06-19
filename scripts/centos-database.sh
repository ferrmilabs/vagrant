#!/usr/bin/env bash

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
