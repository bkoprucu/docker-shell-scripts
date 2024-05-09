#!/bin/bash
version="16"
volume_name="postgresql_$version"
container_name="postgresql_$RANDOM"

password="postgres"
host_port=5432

source parse_args.sh

# Default username: postgres
# Default db: postgres

# Environment variables:
# POSTGRES_PASSWORD
# POSTGRES_USER
# POSTGRES_DB

echo -e -n "\nRunning PostgreSql $version. Container: $container_name. "
echo "Volume: $(docker volume create $volume_name). Args: $args"

docker run -d -m 1GB -e POSTGRES_PASSWORD=$password -p $host_port:5432 -v $volume_name:/var/lib/postgresql/data --name $container_name postgres:$version $args
