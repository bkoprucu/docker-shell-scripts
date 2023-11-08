#!/bin/bash
version="latest"
volume_name="redis"
container_name="redis"

host_port=6379

source parse_args.sh

echo -e -n "\nRunning Redis version $version. Container: $container_name. "
echo "Volume: $(docker volume create $volume_name). Args: $args"

docker run --name $container_name -d -m 1GB -v $volume_name:/data -p $host_port:6379 redis:$version redis-server --save 60 1 --loglevel warning $args
