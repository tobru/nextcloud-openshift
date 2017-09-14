# Nextcloud for OpenShift 3

This repository contains an OpenShift 3 template to easily deploy Nextcloud on OpenShift.
With this template it's possible to run your own Nextcloud instance f.e. on [APPUiO](https://appuio.ch/).

## Installation

### 0 Create OpenShift project

Create an OpenShift project if not already provided by the service

```
PROJECT=nextcloud
oc new-project $PROJECT
```

### 1 Deploy Database

```
oc -n openshift process mariadb-persistent -p MYSQL_DATABASE=nextcloud | oc -n $PROJECT create -f -
```

### 2 Deploy Nextcloud

```
oc process -f https://raw.githubusercontent.com/tobru/nextcloud-openshift/master/nextcloud.yaml -p NEXTCLOUD_HOST=nextcloud.example.com | oc -n $PROJECT create -f -
```

#### Template parameters

Execute the following command to get the available parameters:

```
oc process -f https://raw.githubusercontent.com/tobru/nextcloud-openshift/master/nextcloud.yaml --parameters
```

### 3 Configure Nextcloud

* Navigate to http://nextcloud.example.com
* Fill in the form and finish the installation. The DB credentials can be 
  found in the secret `mariadb`. In the Webconsole it can be found under
  `Resources -> Secrets -> mariadb -> Reveal Secret`

**Hints**

* You might want to enable TLS for your instance

## Backup

### Database

You can use the provided DB dump `CronJob` template:

```
oc process -f https://raw.githubusercontent.com/tobru/nextcloud-openshift/master/mariadb-backup.yaml | oc -n MYNAMESPACE create -f -
```

This script dumps the DB to the same PV as the database stores it's data.
You must make sure that you copy these files away to a real backup location.

### Files

To backup files, a simple solution would be to run f.e. [restic](http://restic.readthedocs.io/) in a Pod
as a `CronJob` and mount the PVCs as volumes. Then use an S3 endpoint for restic
to backup data to.

## Notes

* Nextcloud Cronjob is called from a `CronJob` object every 15 minutes
* The Dockerfile just add the `nginx.conf` to the Alpine Nginx container

To use the `occ` CLI, you can use `oc exec`:

```
oc get pods
oc exec NEXTCLOUDPOD -c nextcloud -ti php occ
```

## Ideas

* Use sclorg Nginx instead of Alpine Nginx for better OpenShift compatibility
* Autoconfigure Nextcloud using `autoconfig.php`
* Provide restic Backup example

## Contributions

Very welcome!

1. Fork it (https://github.com/tobru/nextcloud-openshift/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
