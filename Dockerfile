FROM php:7.0.6-fpm

RUN apt-get update \
    && curl -sL https://deb.nodesource.com/setup | bash - \
    && apt-get install -y git libssl-dev zlib1g-dev libicu-dev g++ \
    && pecl install xdebug \ 
    && echo zend_extension=xdebug.so > /usr/local/etc/php/conf.d/xdebug.ini \
    && docker-php-ext-install zip intl

ADD docker-cfg-template/php.ini /usr/local/etc/php/php.ini

WORKDIR /var/www/app

