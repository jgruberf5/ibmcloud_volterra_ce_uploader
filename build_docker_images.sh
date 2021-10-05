#!/bin/bash

# If the DOCKER_REPO varaible is set, assure it ends in forward slash and insert into build

echo "building docker images"
if ! [ -z "$DOCKER_REPO" ]
then
    [[ "${DOCKER_REPO}" != */ ]] && DOCKER_REPO="${DOCKER_REPO}/"
else
    DOCKER_REPO=''
fi

CACHE_OPTION=''
if [ -z "$USE_CACHED_IMAGES" ]
then
    CACHE_OPTION='--no-cache'
fi

echo "building IBM public cloud object storage uploader"
docker build --rm ${CACHE_OPTION} -t ${DOCKER_REPO}ibmcloud_volterra_ce_uploader:latest .