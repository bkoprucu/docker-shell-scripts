#!/bin/bash
volume_name="redis"
container_name="redis"
hostport=6379

argver=$1
if [ $# -gt 1 ] && [ ${#argver} -eq 5 ]; then
    version=$argver
    args=${@:2}
else
    version="latest"
    args=${@}
fi

echo "Using volume $(docker volume create $volume_name)"
echo "Running Redis version: $ver"
docker run --name $container_name -d -m 1GB -v $volume_name:/data -p $hostport:6379 redis:$version redis-server --save 60 1 --loglevel warning
