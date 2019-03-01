#!/usr/bin/env bash
export RELEASE_VERSION="v$(date +%Y%m%d%H%M)"
docker build . -t repo.adeo.no:5443/fpmock2:${RELEASE_VERSION} -f ./Dockerfile --no-cache
docker push repo.adeo.no:5443/fpmock2:${RELEASE_VERSION}