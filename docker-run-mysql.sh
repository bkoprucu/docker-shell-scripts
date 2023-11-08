#!/bin/bash
version="8.0.35"
volume_name="mysql_wp"
container_name="mysql_wp"

root_password="root"
host_port=3306

# Useful environment variables
#MYSQL_DATABASE
#MYSQL_USER
#MYSQL_PASSWORD
#MYSQL_ROOT_PASSWORD

source parse_args.sh

echo -e -n "\nRunning MySql $version. Container: $container_name. "
echo "Volume: $(docker volume create $volume_name). Args: $args"

docker run -d -m 1GB -e MYSQL_ROOT_PASSWORD=$root_password -p $host_port:3306 -v $volume_name:/var/lib/mysql --name $container_name mysql:$version $args
