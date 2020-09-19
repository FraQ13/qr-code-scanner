FROM php:7.4-apache

RUN apt-get -y update --fix-missing

# Install useful tools
RUN apt-get -y install apt-utils vim wget sudo

# Install important libraries
RUN apt-get -y install git curl libcurl4 zip openssl

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt-get -y install  libsqlite3-dev \ 
                        libsqlite3-0 \ 
                        # mariadb-client \
                        zlib1g-dev \
                        libicu-dev g++

# Install PHP Intl ext
RUN docker-php-ext-install intl \
    && docker-php-ext-configure intl

# Other PHP7 Extensions
RUN docker-php-ext-install  pdo_mysql  \
                            tokenizer \
                            json

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev

# install process control system
RUN apt -y install supervisor

# ext: Data Structures (php-ds)
RUN apt-get -qq update && \
    apt-get clean && \
    pecl install -o ds && \
    echo "extension=ds.so" > /usr/local/etc/php/conf.d/ds.ini && \
    rm -r /var/lib/apt/lists/*

# Enable apache modules
RUN a2enmod rewrite headers

# Create new user
RUN adduser --disabled-password --gecos '' docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN docker-php-ext-install pcntl
RUN docker-php-ext-install bcmath

RUN usermod -a -G docker www-data
RUN usermod -a -G www-data docker

USER docker

# Install NodeJs
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y nodejs \
    npm                   

RUN bash

USER root
