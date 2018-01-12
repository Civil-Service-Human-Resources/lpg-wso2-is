# WSO2 Identity Service

This project contains extensions and configuration for WSO2 IS and packages the 
application for deployment using Docker.

## Start it up
To start everything, for now run `scripts/reset.sh`. This starts and configures the database
before building and starting WSO2.

Once started the script runs `docker logs -f wso2` which you can safely ^c out of without
killing the containers.
