#!/bin/bash

version="latest" # Default version
container_name="redis_cli_$RANDOM"

source parse_args.sh

echo -e "\nRunning redis-cli $version. Container: $container_name  Args: $args"
### Useful args:
# -h : host

docker run -it --rm -m 512MB --name $container_name --network=host redis:$version redis-cli $args
