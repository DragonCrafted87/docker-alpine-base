#!/usr/bin/env bash

docker build \
    --platform linux/amd64,linux/arm64 \
    --tag dragoncrafted87/alpine \
    --tag dragoncrafted87/alpine:3.19 \
    --tag ghcr.io/dragoncrafted87/alpine \
    --tag ghcr.io/dragoncrafted87/alpine:3.19 \
    .
