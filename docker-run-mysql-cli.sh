#!/bin/bash

version="8.0.35" # Default version
container_name="mysql_cli_$RANDOM"

source parse_args.sh

echo -e "\nRunning mysql-cli $version. Container: $container_name. Args: $args"

# mysql-cli -h myhost --port serverport -u myuser -pmypassword mydb
docker run -it --rm -m 512MB --name $container_name --network=host mysql:$version mysql --protocol=TCP $args
