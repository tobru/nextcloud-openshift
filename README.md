# Todo for OpenShift readyness

* PHP FPM timeout configuration
* Nextcloud log to stdout/stderr
* Mail sending
* Export OpenShift definitions as template
* liveness/readiness probes
* Usage Documentation
* Backup: DB, Files
* DB config with Env vars: https://github.com/nextcloud/docker/commit/72ef7897e66f6657e81679386ab60a98ef6509f1
* OC Template

## File Permissions

When using volumes for the directories which data is written to, no changes to the
original image is needed.
