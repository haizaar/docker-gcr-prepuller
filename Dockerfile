ARG DOCKER_VER
FROM docker:$DOCKER_VER

ARG VERSION
ARG OS
ARG ARCH

RUN apk add --no-cache curl

RUN echo "ARCH=$ARCH"
RUN set -ex && \
    curl -fsSL "https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v${VERSION}/docker-credential-gcr_${OS}_${ARCH}-${VERSION}.tar.gz" \
      | tar xz --to-stdout ./docker-credential-gcr \
      > /usr/bin/docker-credential-gcr && \
    chmod 755 /usr/bin/docker-credential-gcr

RUN docker-credential-gcr configure-docker
