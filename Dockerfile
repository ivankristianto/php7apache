FROM php:7.0.9-apache
MAINTAINER Ivan Kristianto <ivan@ivankristianto.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt bcmath \
	&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    gd fileinfo json mysqli zip

RUN apt-get install -y unzip \
    && curl -sS https://codeload.github.com/phpredis/phpredis/zip/php7 -o /tmp/phpredis.zip \
    && cd /tmp \
    && unzip phpredis.zip \
    && mv /tmp/phpredis-php7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis \
    && apt-get autoremove -y unzip \
    && rm /tmp/phpredis.zip

# Install Memcached for php 7
RUN apt-get install -y libpq-dev libmemcached-dev curl \
    && curl -L -o /tmp/memcached.tar.gz "https://github.com/php-memcached-dev/php-memcached/archive/php7.tar.gz" \
    && mkdir -p /usr/src/php/ext/memcached \
    && tar -C /usr/src/php/ext/memcached -zxvf /tmp/memcached.tar.gz --strip 1 \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \
    && rm /tmp/memcached.tar.gz

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN a2enmod rewrite

VOLUME /var/www/html
CMD ["apache2-foreground"]
