# WSO2 Identity Service

This project contains extensions and configuration for WSO2 IS and packages the
application for deployment using Docker.

## Start it up

To start everything, for now run `scripts/reset.sh`. This starts and configures the database
before building and starting WSO2.

Once started the script runs `docker logs -f wso2` which you can safely ^c out of without
killing the containers.

## Configuration

WSO2 will start up configured to connect to postgres and with LPG UI as a service provider.
To customise the configuration of these components, and of WSO2 the following environment
variables can be overridden:

* DATABASE_URL (Default: jdbc:postgresql://postgres:5432/wso2is)
* DATABASE_USER (Default: user)
* DATABASE_PASSWORD (Default: password)
* CARBON_PROTOCOL (Default: https)
* CARBON_HOST (Default: identity.local.cshr.digital)
* CARBON_PORT (Default: 9443)
* LPG_UI_URL (Default: http://lpg.local.cshr.digital:3001)
