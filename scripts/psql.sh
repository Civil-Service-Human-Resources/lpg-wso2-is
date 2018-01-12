#!/bin/sh

docker run --rm --net="host" -it jbergknoff/postgresql-client postgresql://user:password@localhost:5432/wso2is
