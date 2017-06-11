# Todo for OpenShift readyness

* Data directory problem: `Daten-Verzeichnis (/var/www/html/data) ist ungültig. Bitte stelle sicher, dass das Datenverzeichnis auf seiner ersten Ebene eine Datei namens „.ocdata“ enthält.`
* `php occ` doesn't work when in use with ConfigMap: `Console has to be executed with the user that owns the file config/config.php`. Idea: mount config.php to /etc/... and copy it in the entrypoint script to to correct place
* Cleanup Dockerfiles and bring it upstream (file permissions)
* PHP FPM timeout configuration
* PHP opcache?
* Review nginx configuration
* Nextcloud log to stdout/stderr
* Mail sending
* Export OpenShift definitions as template
* Convert config.php to ConfigMap -> Define persistent storage volumes
* DB Params as environment vars
* Some environment vars like password from secrets
* App handling (separate folder for apps installed in webinterface). Idea: Install apps during build using build env vars.
* Cron job
* liveness/readiness probes
* Redis and Database configuration via environment variables
* Usage Documentation
* Make use  of NEXTCLOUD_CONFIG_DIR

## Log output to look into

```
client 10.130.0.1 closed keepalive connection (104: Connection reset by peer)
```
-> Not sure if important

```
[08-Mar-2017 20:42:46] NOTICE: [pool www] 'user' directive is ignored when FPM is not running as root
[08-Mar-2017 20:42:46] NOTICE: [pool www] 'user' directive is ignored when FPM is not running as root
[08-Mar-2017 20:42:46] NOTICE: [pool www] 'group' directive is ignored when FPM is not running as root
[08-Mar-2017 20:42:46] NOTICE: [pool www] 'group' directive is ignored when FPM is not running as root
```
-> Change pool configuration

```
[08-Mar-2017 20:42:46] NOTICE: fpm is running, pid 1
```
-> Add dumb-init
