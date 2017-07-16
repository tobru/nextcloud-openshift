FROM nextcloud:fpm

# Correct dir permissions for OpenShift
RUN chgrp -R 0 /usr/src/nextcloud && \
    chmod -R g+rwX /usr/src/nextcloud

# Override entrypoint with custom one
COPY docker-entrypoint.sh /entrypoint.sh
