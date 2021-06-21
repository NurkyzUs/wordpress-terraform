#!/bin/bash/
sudo yum install mariadb-server -y
sudo systemctl start mariadb 
systemctl enable mariadb 