#!/bin/bash

set -e

if [ -z "$(which kubectl)" ]; then
  echo "You must install kubectl in order to execute this script"
  exit 1
fi

kubectl apply -f - <<EOF
apiVersion: v1
kind: Namespace
metadata:
  name: envoy
EOF

kubectl apply -f ./envoy-k8s.yaml
kubectl apply -f ./api-k8s.yaml
