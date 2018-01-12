#!/usr/bin/env bash

# Start wso2 docker file from local build

# This script assumes, and is only useful when, you are running postgres via docker-compose and want to do local
# dev on wso2

docker kill wso2

pushd $(dirname $0)/..

./gradlew build

docker build -t cshr/wso2-is .
docker run -d --rm --name wso2 --net="wso2is_default" -p 9443:9443 cshr/wso2-is

popd

docker logs -f wso2
