
# FROM icr.io/appcafe/open-liberty:kernel-slim-java17-openj9-ubi
FROM icr.io/appcafe/open-liberty:kernel-slim-java21-openj9-ubi-minimal

COPY --chown=1001:0 /src/main/liberty/config /config

ENV http_proxy ""
ENV https_proxy ""
ENV no_proxy "localhost,127.0.0.1"


RUN features.sh --no-proxy

COPY --chown=1001:0 target/*.war /config/apps

RUN configure.sh
