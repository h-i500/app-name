
# FROM icr.io/appcafe/open-liberty:kernel-slim-java17-openj9-ubi
FROM icr.io/appcafe/open-liberty:kernel-slim-java21-openj9-ubi-minimal

COPY --chown=1001:0 /src/main/liberty/config /config

# RUN unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY && \
#     featureUtility installServerFeatures --acceptLicense defaultServer --noCache

# RUN features.sh

RUN unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY && \
    featureUtility installServerFeatures --acceptLicense defaultServer --noCache && \
    unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY && \
    features.sh

COPY --chown=1001:0 target/*.war /config/apps

RUN configure.sh
