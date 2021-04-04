#!/bin/bash

set -e

[ -z "$(which kubectl)" ] && \
  (echo "You must install kubectl in order to execute this script" && exit 1)

kubectl apply -f ./k8s/
