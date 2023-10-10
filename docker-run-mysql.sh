#!/bin/bash
if [ -z $1 ]; then
	container="mysql_wp"
else
	container=$1
fi

if [ -z $2 ]; then
	volume=$container
else
	volume=$2
fi


#if [ -z $(docker volume ls -q | grep $volume_name) ]; then
#	echo "Creating volume $volume_name"
echo "Using volume $(docker volume create $volume)"
#fi

docker run -d -m 1GB -e MYSQL_ROOT_PASSWORD='root' -p 3306:3306 -v $volume:/var/lib/mysql --name $container mysql:8.0.33
