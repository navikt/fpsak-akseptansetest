#!/usr/bin/env bash
export RELEASE_VERSION=latest
docker build . -t repo.adeo.no:5443/fpsak-for-vtp:${RELEASE_VERSION} -f ./Dockerfile --no-cache
