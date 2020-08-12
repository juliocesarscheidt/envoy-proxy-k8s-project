# Envoy proxy with K8S project

[![Build Status](https://travis-ci.org/julio-cesar-development/envoy-proxy-k8s-project.svg)](https://travis-ci.org/julio-cesar-development/envoy-proxy-k8s-project)
[![GitHub Status](https://badgen.net/github/status/julio-cesar-development/envoy-proxy-k8s-project)](https://github.com/julio-cesar-development/envoy-proxy-k8s-project)
![License](https://badgen.net/badge/license/MIT/blue)

> This is a project to try out Envoy Proxy with Kubernetes

## About

> This project has a K8S deployment with 3 replicas of an API made with GoLang, a K8S headless service that resolves the DNS to the 3 replicas running on it.
> The Envoy is used to handle requests in this DNS of the K8S headless service and do the load balancing for the pods using the LEAST_REQUEST method

## Architecture

![Architecture](https://raw.githubusercontent.com/julio-cesar-development/envoy-proxy-k8s-project/master/envoy.png)

## Instructions

> In order to run the deployments in K8S, run the script deploy.sh

```bash
# Envoy needs to be running first
kubectl apply -f ./traefik-ingress-controller.yaml

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

## Docs

> Envoy

[https://www.envoyproxy.io/docs/envoy/latest/start/start](https://www.envoyproxy.io/docs/envoy/latest/start/start)<br>
[https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/examples](https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/examples)<br>
[https://github.com/envoyproxy/envoy/tree/master/examples](https://github.com/envoyproxy/envoy/tree/master/examples)<br>
[https://www.envoyproxy.io/docs/envoy/v1.5.0/intro/deployment_types/service_to_service#service-to-service-egress-listener](https://www.envoyproxy.io/docs/envoy/v1.5.0/intro/deployment_types/service_to_service#service-to-service-egress-listener)<br>
[https://blog.markvincze.com/how-to-use-envoy-as-a-load-balancer-in-kubernetes/](https://blog.markvincze.com/how-to-use-envoy-as-a-load-balancer-in-kubernetes/)<br>
[https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.14.0](https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.14.0)<br>

> Traefik

[https://docs.traefik.io/routing/services/#weighted-round-robin](https://docs.traefik.io/routing/services/#weighted-round-robin)<br>
[https://docs.traefik.io/v1.7/configuration/backends/kubernetes/](https://docs.traefik.io/v1.7/configuration/backends/kubernetes/)<br>
[https://docs.traefik.io/v1.7/user-guide/kubernetes/](https://docs.traefik.io/v1.7/user-guide/kubernetes/)<br>

## Authors

[Julio Cesar](https://github.com/julio-cesar-development)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
