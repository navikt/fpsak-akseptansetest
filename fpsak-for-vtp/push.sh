#!/usr/bin/env bash
export RELEASE_VERSION="v$(date +%Y%m%d%H%M)"

docker build . -t repo.adeo.no:5443/fpsak-for-vtp:${RELEASE_VERSION} -f ./Dockerfile --no-cache
docker push repo.adeo.no:5443/fpsak-for-vtp:${RELEASE_VERSION}

docker build . -t repo.adeo.no:5443/fpmock2:${RELEASE_VERSION} -f ./DockerfileMock2 --no-cache
docker push repo.adeo.no:5443/fpmock2:${RELEASE_VERSION}
