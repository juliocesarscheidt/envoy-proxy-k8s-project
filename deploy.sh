#!/bin/bash

set -e

# kubectl apply -f ./nginx-ingress-controller.yaml
# kubectl get pod,deploy,svc -n ingress-nginx

kubectl apply -f ./api-deployment.yaml
kubectl apply -f ./api-svc.yaml

kubectl apply -f ./envoy-deployment.yaml
kubectl apply -f ./envoy-svc.yaml

kubectl apply -f ./ingress-svc.yaml
