#!/bin/bash
tag=$1-$2-alpine
image=${IMG_PREFIX}/magnolia-base
if DOCKER_CLI_EXPERIMENTAL=enabled docker manifest inspect $image:$tag >/dev/null; then
   echo "${image}:${tag} seems to already exist!"
else
   docker push ${image}:${tag}
fi
