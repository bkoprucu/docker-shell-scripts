#!/bin/bash
version="16"
container_name="postgresql-cli-$RANDOM"

source parse_args.sh

echo -e "\nRunning PostgreSql client $version. Container: $container_name. Args: $args"

## Useful args:
# psql -h hostname -p port -d dbname -U username -W
# -W : Prompt for password
# -l : List available databases
# -? : Help

# Sample
# docker-run-postgresql-cli.sh -v 15 -h localhost -p 5432 -U postgres -W

docker run -it --rm -m 512MB --name $container_name --network=host postgres:$version psql $args
