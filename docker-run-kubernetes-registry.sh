#!/bin/sh

port="6000"

if [[ -n $1 ]]; then
    if [[ $1 = "-h" ]]; then
        echo "Usage: docker-run-kubernetes-registry.sh [local_port]"
        exit
    else
        port=$1
    fi
fi
 
echo "Running Kubernetes registry on port $port"
docker run -d --rm -p $port:5000 --name registry registry:2
