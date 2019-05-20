#!/usr/bin/env bash

unwrap.sh
export IMAGE_NAME=repo.adeo.no:5443/localhost-ssl-term
export RELEASE_VERSION="v$(date +%Y%m%d%H%M)"
docker build -t ${IMAGE_NAME}:${RELEASE_VERSION} .
docker push ${IMAGE_NAME}:${RELEASE_VERSION}
rm localhost.*
