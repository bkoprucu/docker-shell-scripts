#!/bin/bash

ver="8.0.35" # Default version

function usage {
    echo -n "Usage $(basename $0) [-v] version ..." >&2
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

echo "Running mqsql client version: $ver. Args: $args"
docker run -it --rm -m 512MB --name mysql_cli_$RANDOM --network=host mysql:$ver mysql --protocol=TCP $args
