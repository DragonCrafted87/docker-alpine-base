FROM alpine:3.12

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="DragonCrafted87 Base Multi Arch Alpine Docker" \
      org.label-schema.description="Alpine Image with python preinstalled to use as a base image." \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/DragonCrafted87/docker-alpine-base" \
      org.label-schema.version=$VERSION \
      org.label-schema.schema-version="1.0"

COPY root/. /

RUN apk add --update \
    py3-pip \
    python3 \
    tzdata && \
    rm  -rf /tmp/* /var/cache/apk/* && \
    chmod +x /docker_service_init && \
    chmod +x -R /scripts/*

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

CMD ["/docker_service_init"]
