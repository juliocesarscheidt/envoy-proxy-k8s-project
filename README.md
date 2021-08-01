# Envoy proxy with K8S project

[![Build Status](https://travis-ci.com/juliocesarscheidt/envoy-proxy-k8s-project.svg)](https://travis-ci.com/juliocesarscheidt/envoy-proxy-k8s-project)
[![GitHub Status](https://badgen.net/github/status/juliocesarscheidt/envoy-proxy-k8s-project)](https://github.com/juliocesarscheidt/envoy-proxy-k8s-project)
![License](https://badgen.net/badge/license/MIT/blue)

> This is a project to try out Envoy Proxy with Kubernetes

## About

> This project has a K8S deployment with 3 replicas of an API made with GoLang, a K8S headless service that resolves the DNS to the 3 replicas running on it.
> The Envoy is used to handle requests in this DNS of the K8S headless service and do the load balancing for the pods using the LEAST_REQUEST method

## Architecture

![Architecture](./images/envoy.png)

## Instructions

> Running locally with docker

```bash
docker-compose up -d
```

> In order to run the deployments in K8S, run the script deploy.sh

```bash
chmod +x ./deploy.sh && \
    bash ./deploy.sh

# to see info about K8S deployed objects
kubectl get pod,deploy,svc,ingress,limitrange -n envoy -o wide
```

> Access the ingress to see each request being redirected to a different pod

```bash
curl http://localhost
```

> Or get the IP of Envoy service, and access it on port 80

```bash
ENVOY_SVC_IP=$(kubectl get svc -n envoy --selector=app=envoy -o json | jq -r '.items[].spec.clusterIP')
curl http://${ENVOY_SVC_IP}
```

## Authors

[Julio Cesar](https://github.com/juliocesarscheidt)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
