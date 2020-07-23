#!/bin/bash

set -e

if [ -z "$(which kubectl)" ]; then
  echo "You must install kubectl in order to execute this script"
  exit 1
fi

# Envoy deployment
kubectl apply -f ./traefik-ingress-controller.yaml

# wait for Envoy
sleep 30

kubectl apply -f ./envoy-k8s.yaml
kubectl apply -f ./api-k8s.yaml
