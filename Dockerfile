FROM nextcloud:12-fpm

RUN chgrp -R 0 /var/www/html && \
    chgrp -R 0 /usr/src/nextcloud && \
    chmod -R g+rwX /var/www/html && \
    chmod -R g+rwX /usr/src/nextcloud

#COPY docker-entrypoint.sh /entrypoint.sh
