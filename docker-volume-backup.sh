#!/bin/bash
function containers_using_volume {
    docker container ls --format '{{.Names}}' --filter volume=$1
}


if [ -z $1 ]; then
    echo "Usage: dvolume_backup [volume_name]"
    exit 1
fi

containers=$( containers_using_volume $1 )
if [[ -n $containers ]]; then
    echo "Volume $1 is in use by container(s):"
    echo "$containers"
    exit 1
fi
    
echo "Backing up $1"
filename="$1_$(date +%Y-%m-%d_%H%M%S).tar.bz2"
docker run -v $1:/volume -v .:/backup --rm loomchild/volume-backup backup -v $filename
echo "Backup saved into $filename"
