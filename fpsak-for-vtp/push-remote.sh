#!/usr/bin/env bash
docker build . -t repo.adeo.no:5443/fpsak-for-vtp:${RELEASE_VERSION} -f ./Dockerfile --no-cache
docker push repo.adeo.no:5443/fpsak-for-vtp:${RELEASE_VERSION}
