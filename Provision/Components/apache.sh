#!/bin/bash

apt-get update -y
apt-get install -y apache2

sudo sed -i 's/export APACHE_RUN_USER=www-data/#export APACHE_RUN_USER=www-data\nexport APACHE_RUN_USER=vagrant/' /etc/apache2/envvars
sudo sed -i 's/export APACHE_RUN_GROUP=www-data/#export APACHE_RUN_GROUP=www-data\nexport APACHE_RUN_GROUP=vagrant/' /etc/apache2/envvars
sudo service apache2 restart