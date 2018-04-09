FROM java:8

ARG IS_VERSION=${VERSION:-5.4.0-update3}

WORKDIR /opt/wso2is-${IS_VERSION}

RUN wget -q -P /opt https://github.com/wso2/product-is/releases/download/v${IS_VERSION}/wso2is-${IS_VERSION}.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2is-${IS_VERSION}.zip -d /opt && \
    rm /opt/wso2is-${IS_VERSION}.zip

RUN wget -q -P ./repository/components/lib https://jdbc.postgresql.org/download/postgresql-42.1.4.jar

ADD https://github.com/Civil-Service-Human-Resources/lpg-terraform-paas/releases/download/hammer-0.1/hammer /bin/hammer
RUN chmod +x /bin/hammer && echo "Hammer v0.1 Added"

COPY src/main/overlay .

ENV CARBON_HOST=identity.local.cshr.digital \
    CARBON_PORT=9443 \
    CARBON_PROTOCOL=https \
    DATABASE_PASSWORD=password \
    DATABASE_URL=jdbc:postgresql://postgres:5432/wso2is \
    DATABASE_USER=user \
    LPG_MANAGEMENT_UI_URL=http://lpg.local.cshr.digital:3003 \
    LPG_UI_URL=http://lpg.local.cshr.digital:3001 \
    SMTP_USER=user \
    SMTP_PASSWORD=password \
    ADMIN_USER=admin@cslearning.gov.uk \
    ADMIN_PASSWORD=changeme!12
EXPOSE 8080 9443

CMD ["bin/wso2server.sh"]
