FROM dockerfile/java:oracle-java8

ENV bamboo_VERSION 5.9.3
ENV bamboo_HOME /opt/bamboo-home
ENV HOME /opt/bamboo-home

RUN mkdir /opt/bamboo && \
    mkdir /opt/bamboo-home
RUN wget -O - \
      http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-${bamboo_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/bamboo \
    && echo "bamboo.home = ${bamboo_HOME}" > \
       /opt/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

WORKDIR /opt/bamboo
VOLUME ["/opt/bamboo-home"]

CMD ["/opt/bamboo/apache-tomcat/bin/catalina.sh", "run"]
