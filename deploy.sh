#!/bin/bash

set -e

if [ -z "$(which kubectl)" -o -z "$(which helm)" ]; then
  echo "You must install kubectl and helm tools in order to execute this script"
  exit 1
fi

# namespaces
kubectl apply -f ./namespaces.yaml

# limit range
kubectl apply -f ./limit-range.yaml

# API objects
kubectl apply -f ./api-deployment.yaml
kubectl apply -f ./api-svc.yaml

# Envoy objects
kubectl apply -f ./envoy-deployment.yaml
kubectl apply -f ./envoy-svc.yaml

# Nginx ingress
INGRESS_INSTALLED=$(helm ls --all -n ingress-nginx | grep deployed)
if [ -z "${INGRESS_INSTALLED}" ]; then
  helm repo add nginx-stable https://helm.nginx.com/stable
  helm repo update
  helm install ingress-nginx \
    -n ingress-nginx \
    --set controller.watchNamespace=envoy \
    --set controller.kind=deployment \
    --set controller.service.name=ingress-nginx \
    --set controller.service.httpPort.enable=true \
    --set controller.service.httpPort.port=80 \
    nginx-stable/nginx-ingress
  # kubectl get pod,deploy,svc -n ingress-nginx -o wide
fi

# Ingress service
kubectl apply -f ./ingress-svc.yaml
