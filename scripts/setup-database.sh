#!/bin/sh

function run {
    docker run --rm --net="host" -v `pwd`/$(dirname $0):/scripts jbergknoff/postgresql-client postgresql://user:password@localhost:5432/wso2is $1 "$2"
}

run -c "drop database wso2is"
run -c "create database wso2is"
run -f /scripts/postgres-base.sql
run -f /scripts/postgres-bpel.sql
run -f /scripts/postgres-identity.sql
run -f /scripts/postgres-metrics.sql
