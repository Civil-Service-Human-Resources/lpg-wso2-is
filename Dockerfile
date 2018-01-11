FROM java:8

ENTRYPOINT ["bin/wso2server.sh"]

EXPOSE 9443 9763 8000 10500

ARG IS_VERSION=${VERSION:-5.4.0-update3}

WORKDIR /opt/wso2is-${IS_VERSION}

RUN wget -P /opt https://github.com/wso2/product-is/releases/download/v${IS_VERSION}/wso2is-${IS_VERSION}.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2is-${IS_VERSION}.zip -d /opt && \
    rm /opt/wso2is-${IS_VERSION}.zip
