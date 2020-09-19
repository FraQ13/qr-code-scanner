#!/bin/bash

su docker;

cd /var/www/html; composer install;
cd /var/www/html; composer dump-autoload;
cd /var/www/html; php artisan key:generate;
cd /var/www/html; php artisan migrate --force;
cd /var/www/html; php artisan db:seed;
cd /var/www/html; npm install; npm run dev;

sudo a2enmod ssl;
sudo service apache2 restart;
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt;
