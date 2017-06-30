# Todo for OpenShift readyness

* Usage Documentation
* Backup: DB, Files

# Installation

## 1 Deploy Database

```
oc -n openshift process mariadb-persistent -p MYSQL_DATABASE=nextcloud | oc -n MYNAMESPACE create -f -
```

## 2 Deploy Nextcloud

```
oc process -f https://raw.githubusercontent.com/tobru/nextcloud-openshift/master/nextcloud.yaml -p NEXTCLOUD_HOST=nextcloud.example.com | oc -n MYNAMESPACE create -f -
```

### Template parameters

Just execute the following command to get the available parameters:

```
oc process -f https://raw.githubusercontent.com/tobru/nextcloud-openshift/master/nextcloud.yaml --parameters
```

## 3 Configure Nextcloud

* Navigate to http://nextcloud.example.com
* to be continued

**Hints**

# Backup

Still to be done

# Notes

* Nextcloud Cronjob is called from OpenShift `CronJob` object every 15 minutes
