#!/bin/bash

chmod 777 /var/www/html/var/files -R;
chmod 777 /var/www/html/var/files/upload;
chmod 777 /var/www/html/var/files/upload/files;
chmod 777 /var/www/html/var/files/thumbs;

su docker;

cd /var/www/html; composer install;
cd /var/www/html; composer dump-autoload;
cd /var/www/html; php bin/artisan key:generate;
cd /var/www/html; php artisan migrate --force;
cd /var/www/html; php artisan db:seed;
cd /var/www/html; npm install; npm run dev;

