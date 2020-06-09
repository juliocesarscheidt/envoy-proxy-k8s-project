#!/bin/bash

set -e

if [ -z "$(which kubectl)" -o -z "$(which helm)" ]; then
  echo "You must install kubectl and helm tools in order to execute this script"
  exit 1
fi

# limit range
kubectl delete -f ./limit-range.yaml

# API objects
kubectl delete -f ./api-deployment.yaml
kubectl delete -f ./api-svc.yaml

# Envoy objects
kubectl delete -f ./envoy-deployment.yaml
kubectl delete -f ./envoy-svc.yaml

# Nginx ingress
helm uninstall ingress-nginx -n ingress-nginx

# Ingress service
kubectl delete -f ./ingress-svc.yaml
