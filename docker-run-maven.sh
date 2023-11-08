#!/bin/bash

version="latest"
container_name="docker-run-maven_$RANDOM"

source parse_args.sh

echo -e "\nRunning maven $version with args: $args"

docker run -it --rm -m 1GB --name $container_name -v .:/usr/src/mymaven -w /usr/src/mymaven maven:$version mvn $args
