#!/bin/bash

default_ver="8.0.33"

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
	ver=$default_ver
	args=${@}
fi	

echo -e "\nRunning mqsql client version: $ver \nArgs: $args\n"
docker run -it --rm -m 512MB --name mysql_cli_$RANDOM --network=host mysql:$ver mysql $args
