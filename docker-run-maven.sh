#!/bin/bash
argver=$1
if [ $# -gt 1 ] && [ ${#argver} -eq 5 ]; then
    ver=$argver
    args=${@:2}
else
    ver="latest"
    args=${@}
fi

echo -e "\nRunning maven version: $ver with args: $args\n"

docker run -it --rm -m 1GB --name docker-run-maven -v .:/usr/src/mymaven -w /usr/src/mymaven maven:$ver mvn $args
