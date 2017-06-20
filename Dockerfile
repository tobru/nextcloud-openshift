FROM nextcloud:12-fpm

# Correct file permissions for Nextcloud
RUN chgrp -R 0 /var/www/html \
               /usr/src/nextcloud/custom_apps \
               /usr/src/nextcloud/config \
               /usr/src/nextcloud/data \
               /usr/src/nextcloud/themes && \
    chmod -R g+rwX /var/www/html \
                   /usr/src/nextcloud/custom_apps \
                   /usr/src/nextcloud/config \
                   /usr/src/nextcloud/data \
                   /usr/src/nextcloud/themes

# Install and enable PHP OPCache
RUN docker-php-ext-install opcache && \
    docker-php-ext-enable opcache
ADD php-opcache.ini /usr/local/etc/php/conf.d/zz-nextcloud-opcache.ini
