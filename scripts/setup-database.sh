#!/bin/sh

function run {
    docker run --rm --net="host" -v `pwd`/$(dirname $0):/scripts jbergknoff/postgresql-client postgresql://user:password@localhost:5432/$1 $2 "$3"
}

run "" -c "drop database wso2is"
run "" -c "create database wso2is"
run wso2is -f /scripts/postgres-base.sql
run wso2is -f /scripts/postgres-bpel.sql
run wso2is -f /scripts/postgres-identity.sql
run wso2is -f /scripts/postgres-metrics.sql
