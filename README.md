### Docker Shell Scripts

#### docker-volume-backup.sh
For backing up Docker volume to a compressed file.
Wraps [loomchild/volume-backup](https://github.com/loomchild/volume-backup), checks if the volume is in use:

```
$ docker-volume-backup.sh postgresql12
Volume postgresql12 is in use by container(s):
postgres-ws2
$ docker stop postgres-ws2
postgres-ws2
$ docker-volume-backup.sh postgresql12
Backing up postgresql12 to postgresql12_2023-11-01_181926.tar.bz2
....
$ _
```

#### docker-volume-restore.sh
Restores Docker volume from a backup  file.

Skips if the volume is in use:
```
$ docker-volume-restore.sh postgresql12
Volume postgresql12 is in use by container(s):
postgres-ws2
$ _
```

Restore can be forced if the volume is not empty:
```
$ docker-volume-restore.sh postgresql12 postgresql12_2023-11-01_181926.tar.bz2 
Restoring volume postgresql12 from postgresql12_2023-11-01_181926.tar.bz2
Target volume is not empty, aborting; use -f to override
$ docker-volume-restore.sh postgresql12 postgresql12_2023-11-01_181926.tar.bz2 -f 
Restoring volume postgresql12 from postgresql12_2023-11-01_181926.tar.bz2
....
$ _
```



#### docker-run-*.sh

Conveniently runs docker images

`docker-run-[mysql | mysql-cli | postgresql...].sh [-h] [-v version] [-n container-name] [-o volume-name] [args]`

`-h`: Print usage

`-v version:` Provide a custom version of the image, instead of the default defined in the script.

`-n container-name:` Provide a custom container name.

`-o volume-name:` Provide a custom volume name.


##### Samples
```
$ docker-run-mysql.sh -v 8.2 -h 127.0.0.1
Running MySql version 8.2. Args: -h 127.0.0.1
f48a379748e8b12cca4dfc00fc6888d91dc6cb62a3a36fc3e9b2da2d281aa788
$ _
```

```
$ docker-run-mysql-cli.sh -v 8.2 -h 127.0.0.1 -u myuser -p
Running mqsql client 8.2. Args: -h 127.0.0.1 -u wpuser -p
Enter password: 
...
mysql> _
```

```
$ docker-run-postgresql.sh -v 12 -n postgres12 -o postgres12v
```

```
$ docker-run-postgresql-cli.sh -v 12 -h localhost -U postgres -W

Running PostgreSql client 12. Container: postgresql-cli-32354. Args: -h localhost -U postgres -W
Password: 
psql (12.15 (Debian 12.15-1.pgdg120+1))
Type "help" for help.

postgres=# _
```
```
docker-run-redis.sh -v 7.0 -n redis70 -o redis70
```
```
docker-run-redis-cli.sh -v 7 -h myredisserver
Running redis-cli version: 7. Args: -h myredisserver
myredisserver:6379> _
```
