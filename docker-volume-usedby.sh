#!/bin/bash
if [ -z $1 ]; then
    echo  "Lists containers using the given volume. Volumes:" >&2
    docker volume ls >&2
else
    docker container ls -a --filter volume=$1
fi
