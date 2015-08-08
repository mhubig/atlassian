FROM relateiq/oracle-java8

ENV STASH_VERSION 3.11.1
ENV STASH_HOME /opt/stash-home
ENV HOME /opt/stash-home

RUN apt-get update -y && \
    apt-get install git -y

RUN mkdir /opt/stash && \
    mkdir /opt/stash-home
RUN wget -O - \
      http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-${STASH_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/stash \
    && perl -i -p -e 's/^JVM_SUPPORT/#JVM_SUPPORT/' /opt/stash/bin/setenv.sh \
    && perl -i -p -e 's/^# umask 0027/umask 0027/'  /opt/stash/bin/setenv.sh

WORKDIR /opt/stash
VOLUME ["/opt/stash-home"]

CMD ["/opt/stash/bin/catalina.sh", "run"]
