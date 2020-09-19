#!/bin/bash

su docker;

cd /var/www/html; composer install;
cd /var/www/html; composer dump-autoload;
cd /var/www/html; php artisan key:generate;
cd /var/www/html; php artisan migrate --force;
cd /var/www/html; php artisan db:seed;
cd /var/www/html; npm install; npm run dev;

