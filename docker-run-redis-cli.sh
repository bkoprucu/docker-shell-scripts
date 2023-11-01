#!/bin/bash

ver="latest" # Default version

function usage {
    echo -e "\nUsage $(basename $0) [-v] version ...\n" >&2
}

getopts 'v:' opt

if [ $opt = "v" ]; then
    if [[ -n $OPTARG ]]; then
        ver=$OPTARG
        args=${@:3}
    else
        $( usage )
        exit 1
    fi
else
    args=${@}
fi

echo "Running redis-cli version: $ver. Args: $args"
docker run -it --rm -m 512MB --name redis_cli_$RANDOM --network=host redis:$ver redis-cli $args
