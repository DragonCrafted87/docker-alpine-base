#!/usr/bin/env bash

docker build \
    --no-cache \
    --tag dragoncrafted87/alpine \
    --tag dragoncrafted87/alpine:3.19 \
    --tag ghcr.io/dragoncrafted87/alpine \
    --tag ghcr.io/dragoncrafted87/alpine:3.19 \
    .
