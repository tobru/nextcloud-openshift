FROM nextcloud:11-fpm

RUN chgrp -R 0 /var/www/html && \
    chmod -R g+rwX /var/www/html

COPY docker-entrypoint.sh /entrypoint.sh
