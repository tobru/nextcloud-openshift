FROM nextcloud:12-fpm

# Correct file permissions for Nextcloud
RUN chown -R www-data:root /usr/src/nextcloud/custom_apps/ \
 && chown -R www-data:root /usr/src/nextcloud/config/ \
 && chown -R www-data:root /usr/src/nextcloud/data/ \
 && chown -R www-data:root /usr/src/nextcloud/themes/
