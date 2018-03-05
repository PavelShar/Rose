#!/bin/bash

apt-get update
apt-get install software-properties-common -y
apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 4F4EA0AAE5267A6C
add-apt-repository ppa:ondrej/php
apt-get update

apt-get install -y \
    php7.1 \
    php7.1-mcrypt \
    php7.1-gd \
    php7.1-mbstring \
    php7.1-zip \
    php7.1-xml \
    php7.1-intl \
    php7.1-fpm \
    php7.1-curl \
    php7.1-mysql \
    php7.1-sybase


locale-gen ru_RU.utf8
locale-gen en_US.utf8
update-locale LANG=en_US.utf8
