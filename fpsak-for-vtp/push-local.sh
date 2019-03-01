#!/usr/bin/env bash
export RELEASE_VERSION="v$(date +%Y%m%d%H%M)"
export RELEASE_VERSION=latest
docker build . -t repo.adeo.no:5443/fpsak-for-vtp:${RELEASE_VERSION} -f ./Dockerfile --no-cache
docker build . -t repo.adeo.no:5443/fpmock2:${RELEASE_VERSION} -f ./DockerfileMock2 --no-cache
