FROM envoyproxy/envoy:v1.14.1

COPY envoy.yaml /etc/envoy.yaml

CMD /usr/local/bin/envoy -c /etc/envoy.yaml

# docker image build \
#   --tag juliocesarmidia/envoy-proxy-01:latest \
#   --tag juliocesarmidia/envoy-proxy-01:v1.0.0 \
#   -f envoy.Dockerfile .

# docker container run --rm juliocesarmidia/envoy-proxy-01:v1.0.0
# docker image push juliocesarmidia/envoy-proxy-01:latest
# docker image push juliocesarmidia/envoy-proxy-01:v1.0.0

# docker pull envoyproxy/envoy:v1.14.1
