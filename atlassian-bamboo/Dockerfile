FROM relateiq/oracle-java8

ENV bamboo_VERSION 5.9.7
ENV bamboo_HOME /opt/bamboo-home
ENV HOME /opt/bamboo-home

RUN mkdir /opt/bamboo && \
    mkdir /opt/bamboo-home
RUN wget -O - \
      http://www.atlassian.com/software/bamboo/downloads/binary/atlassian-bamboo-${bamboo_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/bamboo \
    && perl -i -p -e 's/-Xms512m/-Xms128m/' /opt/bamboo/bin/setenv.sh \
    && perl -i -p -e 's/-Xmx2048m/-Xmx512m/' /opt/bamboo/bin/setenv.sh \
    && perl -i -p -e 's/_%T//' /opt/bamboo/bin/setenv.sh \
    && echo "bamboo.home = ${bamboo_HOME}" > \
       /opt/bamboo/atlassian-bamboo/WEB-INF/classes/bamboo-init.properties

WORKDIR /opt/bamboo
VOLUME ["/opt/bamboo-home"]

CMD ["/opt/bamboo/bin/catalina.sh", "run"]
