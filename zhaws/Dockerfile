ARG BUILD_FROM
FROM ${BUILD_FROM}

ARG ZHAWS_VERSION

# Install ZHAWS
WORKDIR /usr/src
RUN \
    set -x \
    && apk add --no-cache --virtual .build-dependencies \
        build-base \
        git \
        linux-headers \
        python3 \
    && pip3 install --no-cache-dir \
        zhaws[server]==${ZHAWS_VERSION} \
    && apk del --no-cache \
        .build-dependencies

WORKDIR /
COPY rootfs /
