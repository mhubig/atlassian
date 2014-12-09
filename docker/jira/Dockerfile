FROM dockerfile/java:oracle-java7

ENV JIRA_VERSION 6.3.12
ENV JIRA_HOME /opt/jira-home

RUN useradd --create-home --home-dir /opt/jira --shell /bin/bash jira
RUN mkdir /opt/jira-home && chown -R jira:jira /opt/jira-home
RUN wget -O - \
      http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/jira \
    && perl -i -p -e 's/^JVM_SUPPORT/#JVM_SUPPORT/' /opt/jira/bin/setenv.sh \
    && chown -R jira:jira /opt/jira

WORKDIR /opt/jira
VOLUME ["/opt/jira-home"]
USER jira

ENV JVM_SUPPORT_RECOMMENDED_ARGS -Datlassian.plugins.enable.wait=300
CMD ["/opt/jira/bin/catalina.sh", "run"]
