# Todo for OpenShift readyness

* Export OpenShift definitions as template
* Usage Documentation
* Backup: DB, Files

# Installation

## Database

```
oc -n openshift process mariadb-persistent -p MYSQL_DATABASE=nextcloud | oc -n MYNAMESPACE create -f -
```

## File Permissions

When using volumes for the directories which data is written to, no changes to the
original image is needed.
