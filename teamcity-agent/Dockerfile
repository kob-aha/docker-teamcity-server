FROM java

MAINTAINER Koby Aharon <kobyahron@gmail.com>

# TODO
# modprobe loop max_loop=64

# INSTALL TEAMCITY BUILD AGENT
RUN curl -vL --output /opt/buildAgent.zip https://teamcity.jetbrains.com/update/buildAgent.zip && \
    unzip /opt/buildAgent.zip -d /opt/buildAgent && \
    rm -rfv /opt/buildAgent.zip

RUN chmod -c +x /opt/buildAgent/bin/agent.sh

# Override agent configuration file
ADD conf/*.properties /opt/buildAgent/conf/

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 9090
