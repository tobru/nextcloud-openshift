FROM nextcloud:12-fpm

RUN chgrp -R 0 /var/www/html \
               /usr/src/nextcloud/config \
               /usr/src/nextcloud/apps && \
    chmod -R g+rwX /var/www/html \
                   /usr/src/nextcloud/config \
                   /usr/src/nextcloud/apps

#COPY docker-entrypoint.sh /entrypoint.sh
