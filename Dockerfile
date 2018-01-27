FROM java:8

ENTRYPOINT ["bin/wso2server.sh"]

EXPOSE 9443 9763 8000 10500

ENV DATABASE_URL=jdbc:postgresql://postgres:5432/wso2is
ENV DATABASE_USER=user
ENV DATABASE_PASSWORD=password

ENV CARBON_PROTOCOL=https
ENV CARBON_HOST=identity.dev.cshr.digital
ENV CARBON_PORT=9443

ENV LPG_UI_URL=http://lpg.dev.cshr.digital:3001
ENV LPG_COURSE_UI_URL=http://localhost:3002

ARG IS_VERSION=${VERSION:-5.4.0-update3}

WORKDIR /opt/wso2is-${IS_VERSION}

RUN wget -P /opt https://github.com/wso2/product-is/releases/download/v${IS_VERSION}/wso2is-${IS_VERSION}.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2is-${IS_VERSION}.zip -d /opt && \
    rm /opt/wso2is-${IS_VERSION}.zip

RUN wget -P ./repository/components/lib https://jdbc.postgresql.org/download/postgresql-42.1.4.jar

COPY src/main/conf/datasources/master-datasources.xml ./repository/conf/datasources
COPY src/main/conf/identity/application-authentication.xml ./repository/conf/identity
COPY src/main/conf/identity/sso-idp-config.xml ./repository/conf/identity
COPY src/main/conf/identity/service-providers/lpg-ui.xml ./repository/conf/identity/service-providers
COPY src/main/conf/identity/service-providers/lpg-course-ui.xml ./repository/conf/identity/service-providers
COPY src/main/conf/user-mgt.xml ./repository/conf
COPY src/main/conf/claim-config.xml ./repository/conf
COPY src/main/conf/carbon.xml ./repository/conf
COPY src/main/conf/scim2-schema-extension.config ./repository/conf
COPY src/main/bin/wso2server.sh ./bin

#COPY ./build/libs/wso2-is-extensions.jar ./repository/components/dropins
