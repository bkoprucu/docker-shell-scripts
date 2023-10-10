#!/bin/bash
if [ -z $1 ]; then
	echo  "Lists containers using the given volume. Volumes:"
	docker volume ls 
else
	docker container ls -a --filter volume=$1
fi

