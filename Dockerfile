FROM java

MAINTAINER Alexander Ilyin <alexander@ilyin.eu>

# TEAMCITY INTERNAL ENVIRONMENT VARIABLES
ENV TEAMCITY_DATA_PATH /root/.BuildServer
ENV TEAMCITY_SERVER_MEM_OPTS -Xmx750m -XX:MaxPermSize=270m
ENV TEAMCITY_SERVER_OPTS -Dteamcity.git.fetch.separate.process=false

# TEMPORARY ENVIRONMENT VARIABLES
ENV IMAGE_TEAMCITY_PACKAGE_VERSION 9.0.4
ENV IMAGE_TEAMCITY_PACKAGE_FILENAME TeamCity-${IMAGE_TEAMCITY_PACKAGE_VERSION}.tar.gz
ENV IMAGE_TEAMCITY_PACKAGE_PATH /opt/${IMAGE_TEAMCITY_PACKAGE_FILENAME}
ENV IMAGE_TEAMCITY_PACKAGE_URL http://download.jetbrains.com/teamcity/${IMAGE_TEAMCITY_PACKAGE_FILENAME}

VOLUME ${TEAMCITY_DATA_PATH}
EXPOSE 8111

RUN curl -vL --output ${IMAGE_TEAMCITY_PACKAGE_PATH} ${IMAGE_TEAMCITY_PACKAGE_URL} && \
    tar xvf ${IMAGE_TEAMCITY_PACKAGE_PATH} -C /opt/ && \
    rm -fv ${IMAGE_TEAMCITY_PACKAGE_PATH}

ENTRYPOINT ["/opt/TeamCity/bin/teamcity-server.sh"]
CMD  ["run"]
