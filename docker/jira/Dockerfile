FROM dockerfile/java:oracle-java7

ENV JIRA_VERSION 6.2
ENV JIRA_HOME /opt/jira-home

RUN useradd --create-home --home-dir /opt/jira --shell /bin/bash jira
RUN mkdir /opt/jira-home && chown -R jira:jira /opt/jira-home
RUN wget -O - \
      http://www.atlassian.com/software/jira/downloads/binary/atlassian-jira-${JIRA_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/jira \
    && chown -R jira:jira /opt/jira

WORKDIR /opt/jira
VOLUME ["/opt/jira-home"]
USER jira

CMD ["/opt/jira/bin/catalina.sh", "run"]
