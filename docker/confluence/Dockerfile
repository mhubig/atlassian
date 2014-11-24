FROM dockerfile/java:oracle-java7

ENV CONFLUENCE_VERSION 5.4.3
ENV CONFLUENCE_HOME /opt/confluence-home

RUN useradd --create-home --home-dir /opt/confluence \
    --shell /bin/bash confluence
RUN mkdir /opt/confluence-home && \
    chown -R confluence:confluence /opt/confluence-home
RUN wget -O - \
      http://www.atlassian.com/software/confluence/downloads/binary/atlassian-confluence-${CONFLUENCE_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/confluence \
    && echo "confluence.home = ${CONFLUENCE_HOME}" > \
       /opt/confluence/confluence/WEB-INF/classes/confluence-init.properties \
    && chown -R confluence:confluence /opt/confluence

WORKDIR /opt/confluence
VOLUME ["/opt/confluence-home"]
USER confluence

CMD ["/opt/confluence/bin/catalina.sh", "run"]
