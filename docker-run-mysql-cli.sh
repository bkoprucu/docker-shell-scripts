#!/bin/bash

ver="8.0.33" # Default version

function usage {
    echo -n "Usage $(basename $0) [-v] version ..." >&2
    exit 1
}

getopts 'v:' opt
echo "opt: $opt"
if [ $opt = "v" ]; then
    echo "optarg: $OPTARG"
    if [ -n $OPTARG ]; then
        ver=$OPTARG
        args=${@:3}
    else
        $( usage )
    fi
else
    args=${@}
fi
container_name="mysql_cli_$RANDOM"
echo "Running mqsql client version: $ver. Container: $container_name. Args: $args"
docker run -it --rm -m 512MB --name $container_name --network=host mysql:$ver mysql $args
