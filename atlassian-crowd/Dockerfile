FROM dockerfile/java:oracle-java8

ENV CROWD_VERSION 2.8.0
ENV CROWD_HOME /opt/crowd-home

RUN useradd --create-home --home-dir /opt/crowd --shell /bin/bash crowd
RUN mkdir /opt/crowd-home && chown -R crowd:crowd /opt/crowd-home
RUN wget -O - \
      http://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-${CROWD_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/crowd \
    && echo "crowd.home = ${CROWD_HOME}" > \
       /opt/crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties \
    && chown -R crowd:crowd /opt/crowd

WORKDIR /opt/crowd
VOLUME ["/opt/crowd-home"]
USER crowd
ENV HOME ${CROWD_HOME}

CMD ["/opt/crowd/apache-tomcat/bin/catalina.sh", "run"]
