#!/bin/bash
version="15"
volume_name="postgresql_$version"
container_name="postgresql_$RANDOM"

password="postgres"
host_port=5432

source parse_args.sh

#if [ -z $(docker volume ls -q | grep $volume_name) ]; then
#	echo "Creating volume $volume_name"
# echo "Using volume $(docker volume create $volume_name)"
#fi

# Default username: postgres

echo -e -n "\nRunning PostgreSql $version. Container: $container_name. "
echo "Volume: $(docker volume create $volume_name). Args: $args"

docker run -d -m 1GB -e POSTGRES_PASSWORD=$password -p $host_port:5432 -v $volume_name:/var/lib/postgresql/data --name $container_name postgres:$version $args
