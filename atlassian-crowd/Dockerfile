FROM dockerfile/java:oracle-java8

ENV CROWD_VERSION 2.8.3
ENV CROWD_HOME /opt/crowd-home
ENV HOME /opt/crowd-home

RUN mkdir /opt/crowd && \
    mkdir /opt/crowd-home
RUN wget -O - \
      http://www.atlassian.com/software/crowd/downloads/binary/atlassian-crowd-${CROWD_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/crowd \
    && echo "crowd.home = ${CROWD_HOME}" > \
       /opt/crowd/crowd-webapp/WEB-INF/classes/crowd-init.properties

WORKDIR /opt/crowd
VOLUME ["/opt/crowd-home"]

CMD ["/opt/crowd/apache-tomcat/bin/catalina.sh", "run"]
