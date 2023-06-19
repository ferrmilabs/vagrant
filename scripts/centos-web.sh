#!/usr/bin/env bash

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

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/ferrmilabs/vagrant/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/ferrmilabs/vagrant/main/files/info.php

systemctl restart httpd
