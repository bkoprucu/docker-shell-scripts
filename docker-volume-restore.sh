#!/bin/bash
function containers_using_volume {
    docker container ls -a --format '{{.Names}}' --filter volume=$1
}

filename=$2
if [ -z $filename ]; then
    echo "Usage: dvolume_restore [volume_name] [file_name]" >&2
    exit 1
fi;	


echo "Attempting to restore volume $1 from file $filename"

containers=$( containers_using_volume $1 )
if [[ -n $containers ]]; then
    echo "Volume $1 is used by following container(s):" >&2
    echo "$containers" >&2
    exit 1
fi
  
echo "Restoring volume $1 from $filename"
docker run -v $1:/volume -v .:/backup --rm loomchild/volume-backup restore -v $filename
echo "Restore complete"
