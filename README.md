# Envoy proxy with K8S project

> This is a project to try out Envoy Proxy with Kubernetes

## About

> This project has a K8S deployment with 3 replicas of an API made with GoLang, a K8S headless service that resolves the DNS to the 3 replicas running on it.
> The Envoy is used to handle requests in this DNS of the K8S headless service and do the load balancing for the pods using the LEAST_REQUEST method

## Instructions

> In order to run the deployments in K8S, run the script deploy.sh

```bash
chmod +x ./deploy.sh && bash ./deploy.sh

# to see info about K8S deployed objects
kubectl get pod,deploy,svc,ingress -n default -o wide
```

> Get the IP of Envoy service, and access it on port 80, you will see each request being redirected to a different pod

```bash
kubectl get svc --selector=app=envoy -o json | jq -r '.items[].spec.clusterIP'
```

## Some Envoy Docs

> https://www.envoyproxy.io/docs/envoy/latest/start/start
> https://www.envoyproxy.io/docs/envoy/latest/configuration/overview/examples
> https://github.com/envoyproxy/envoy/tree/master/examples
> https://www.envoyproxy.io/docs/envoy/v1.5.0/intro/deployment_types/service_to_service#service-to-service-egress-listener
> https://blog.markvincze.com/how-to-use-envoy-as-a-load-balancer-in-kubernetes/
> https://www.envoyproxy.io/docs/envoy/latest/version_history/v1.14.0
