#!/bin/sh

docker kill wso2
docker-compose down
rm -fr /tmp/wso2-pg-data

docker-compose up -d

echo "Waiting for database to start..."
# Should be more scientific, e.g. check output of postgres container
sleep 20

sh $(dirname $0)/setup-database.sh
sh $(dirname $0)/run-wso2-local.sh
