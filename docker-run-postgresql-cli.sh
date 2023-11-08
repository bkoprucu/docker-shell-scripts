#!/bin/bash
version="15"
container_name="postgresql-cli-$RANDOM"

source parse_args.sh

echo -e "\nRunning PostgreSql client $version. Container: $container_name. Args: $args"

## Useful args:
# psql -h hostname -p port -d dbname -U username -W
# -W : Prompt for password
# -l : List available databases
# -? : Help

docker run -it --rm -m 512MB --name $container_name --network=host postgres:$version psql $args
