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



#### docker-run-mysql-cli.sh

Runs mysql client as if it is installed to current host:

```
$ docker-run-mysql-cli.sh -h mydbhost -u myuser -p mydb
Running mqsql client version: 8.0.35. Args: -h mydbhost -u wpuser -p wpdb
Enter password: 
...
...
mysql> _
```

Define Mysql version with `-v`:
```
$ docker-run-mysql-cli.sh -v 8.2 -h mydbhost -u myuser -p mydb
Running mqsql client version: 8.2. Args: -h mydbhost -u wpuser -p wpdb
Enter password: 
...
...
mysql> _
```

#### docker-run-redis-cli.sh

Runs redis cli as if it is installed to current host:

```
docker-run-redis-cli.sh -v 7
Running redis-cli version: 7. Args: 
127.0.0.1:6379> _
```
