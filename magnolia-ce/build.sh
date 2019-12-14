#!/bin/bash
tag=$1-$2-$3-${4:+$4}
image=${IMG_PREFIX}/magnolia-ce
if DOCKER_CLI_EXPERIMENTAL=enabled docker manifest inspect $image:$tag >/dev/null; then
   echo "${image}:${tag} seems to already exist!"
else
   docker build --build-arg MGNL_VER=$1  \
			    --build-arg TOMCAT_VER=$2  \
                --build-arg JRE_VER=$3  \
                --build-arg DIST=${4:+$4}  \
                --tag ${image}:${tag} .
fi
