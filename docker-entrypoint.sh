#!/bin/bash
set -e

if [ ! -e '/var/www/html/version.php' ]; then
  echo "Extracting app source to /var/www/html"
  tar cf - --one-file-system -C /usr/src/nextcloud . | tar xf - --no-overwrite-dir
  #chown -R www-data /var/www/html
fi

exec "$@"
