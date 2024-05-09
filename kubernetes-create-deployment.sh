#!/bin/bash

app_name=$1
image_name=$2

if [[ $# -ne 2 ]]; then
  echo "Usage kubernetes-create-deployment.sh app_name image_name"
else
  kubectl create deployment $app_name --image $image_name -o yaml --dry-run=client
fi
