FROM nextcloud:11

RUN chgrp -R 0 /var/www/html && \
    chmod -R g+rwX /var/www/html

