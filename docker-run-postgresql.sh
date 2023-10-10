#!/bin/bash
volume_name="postgresql12"
container_name="postgresql12"
version=12
password="postgres"
hostport=5432

#if [ -z $(docker volume ls -q | grep $volume_name) ]; then
#	echo "Creating volume $volume_name"
echo "Using volume $(docker volume create $volume_name)"
#fi
echo "Running Postgresql version: $version"
docker run -d -m 1GB -e POSTGRES_PASSWORD=$password -p $hostport:5432 -v $volume_name:/var/lib/postgresql/data --name $container_name postgres:$version
