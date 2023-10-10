#### Shell scripts for backing up and restoring docker volumes and conveniently running common docker images.

`docker-volume-backup.sh` and `docker-volume-restore.sh`: Wraps  [loomchild/volume-backup](https://github.com/loomchild/volume-backup), checks if the volume is in use.

`docker-run-mysql-cli.sh`, `docker-run-redis-cli.sh`: Runs respective client, as if it is installed on the host
