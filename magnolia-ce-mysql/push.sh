#!/bin/bash
tag=$1-$2-$3-${4:+$4}
image=${IMG_PREFIX}/magnolia-ce-mysql
if DOCKER_CLI_EXPERIMENTAL=enabled docker manifest inspect $image:$tag >/dev/null; then
   echo "${image}:${tag} seems to already exist!"
else
   docker push ${image}:${tag}
fi
