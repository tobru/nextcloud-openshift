FROM nextcloud:12-fpm

RUN chgrp -R 0 /var/www/html && \
    chgrp -R 0 /usr/src/nextcloud/config && \
    chmod -R g+rwX /var/www/html && \
    chmod -R g+rwX /usr/src/nextcloud/config

#COPY docker-entrypoint.sh /entrypoint.sh
