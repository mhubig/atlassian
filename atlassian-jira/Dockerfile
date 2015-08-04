FROM dockerfile/java:oracle-java8

ENV JIRA_VERSION 6.4.9
ENV JIRA_HOME /opt/jira-home
ENV HOME /opt/jira-home

RUN mkdir /opt/jira && \
    mkdir /opt/jira-home
RUN wget -O - \
      http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/jira \
    && perl -i -p -e 's/^JVM_SUPPORT/#JVM_SUPPORT/' /opt/jira/bin/setenv.sh

WORKDIR /opt/jira
VOLUME ["/opt/jira-home"]

ENV JVM_SUPPORT_RECOMMENDED_ARGS -Datlassian.plugins.enable.wait=300
CMD ["/opt/jira/bin/catalina.sh", "run"]
