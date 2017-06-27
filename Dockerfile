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

