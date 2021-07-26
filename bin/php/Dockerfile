FROM php:7.4.21-fpm-buster
RUN apt-get update && apt-get upgrade -y && apt-get install -y libicu-dev libxml2-dev libxslt-dev libzip-dev && \
    docker-php-ext-install bcmath intl pdo_mysql soap xsl zip sockets && \
    apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd && \
    cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/conf.d/php.ini && \
    sed -i 's/^memory_limit.*/memory_limit = 2048M/' $PHP_INI_DIR/conf.d/php.ini && \
    sed -i 's/^;realpath_cache_size.*/realpath_cache_size = 10M/' $PHP_INI_DIR/conf.d/php.ini && \
    sed -i 's/^;realpath_cache_ttl.*/realpath_cache_ttl = 7200/' $PHP_INI_DIR/conf.d/php.ini && \
    sed -i 's/^;opcache.save_comments.*/opcache.save_comments=1/' $PHP_INI_DIR/conf.d/php.ini && \
    sed -i 's/^;opcache.enable=.*/opcache.enable=1/' $PHP_INI_DIR/conf.d/php.ini && \
    sed -i 's/^;opcache.enable_cli=.*/opcache.enable_cli=1/' $PHP_INI_DIR/conf.d/php.ini && \
    PHP_FPM_DIR=/usr/local/etc/php-fpm.d && \
    sed -i 's/^pm.max_children.*/pm.max_children = 30/' $PHP_FPM_DIR/www.conf && \
    sed -i 's/^pm.start_servers.*/pm.start_servers = 8/' $PHP_FPM_DIR/www.conf && \
    sed -i 's/^pm.min_spare_servers.*/pm.min_spare_servers = 4/' $PHP_FPM_DIR/www.conf && \
    sed -i 's/^pm.max_spare_servers.*/pm.max_spare_servers = 8/' $PHP_FPM_DIR/www.conf && \
    usermod -u 1000 www-data && \
    groupmod -g 1000 www-data
