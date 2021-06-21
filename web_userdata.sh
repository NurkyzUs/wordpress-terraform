#!/bin/bash/
sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2 yum install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
sudo yum install php php-mysqlnd php-gd
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
mv wordpress/* /var/www/html/