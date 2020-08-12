FROM envoyproxy/envoy:v1.14.1
LABEL maintainer="Julio Cesar <julio@blackdevs.com.br>"

COPY envoy.yaml /etc/envoy.yaml

CMD /usr/local/bin/envoy -c /etc/envoy.yaml
