
# FROM icr.io/appcafe/open-liberty:kernel-slim-java17-openj9-ubi
FROM icr.io/appcafe/open-liberty:kernel-slim-java21-openj9-ubi-minimal

COPY --chown=1001:0 /src/main/liberty/config /config

# ENV HTTP_PROXY="http://proxy.example.com:8080"
# ENV HTTPS_PROXY="http://proxy.example.com:8080"
# ENV NO_PROXY="localhost,127.0.0.1,repo1.maven.org"
# ENV http_proxy "http://proxy.example.com:8080"
# ENV https_proxy "http://proxy.example.com:8080"
# ENV no_proxy "localhost,127.0.0.1,repo1.maven.org"

# RUN features.sh
# RUN features.sh --no-proxy

COPY --chown=1001:0 target/*.war /config/apps

RUN configure.sh
