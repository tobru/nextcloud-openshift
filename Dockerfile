FROM nextcloud:12-fpm

RUN chgrp -R 0 /var/www/html \
               /usr/src/nextcloud/configi && \
    chgrp 0 /usr/src/nextcloud/apps && \
    chmod -R g+rwX /var/www/html \
                   /usr/src/nextcloud/config && \
    chmod g+rwX /usr/src/nextcloud/apps

#COPY docker-entrypoint.sh /entrypoint.sh
