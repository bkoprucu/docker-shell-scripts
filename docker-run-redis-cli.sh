#!/bin/bash
argver=$1
if [ $# -gt 1 ] && [ ${#argver} -eq 5 ]; then
    ver=$argver
    args=${@:2}
else
    ver="latest"
    args=${@}
fi

echo "Running redis-cli version: $ver. Args: $args"
docker run -it --rm -m 512MB --name redis_cli_$RANDOM --network=host redis:$ver redis-cli $args
