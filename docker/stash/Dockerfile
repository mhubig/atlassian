FROM dockerfile/java:oracle-java8

ENV STASH_VERSION 3.5.0
ENV STASH_HOME /opt/stash-home

RUN useradd --create-home --home-dir /opt/stash --shell /bin/bash stash
RUN mkdir /opt/stash-home && chown -R stash:stash /opt/stash-home
RUN wget -O - \
      http://www.atlassian.com/software/stash/downloads/binary/atlassian-stash-${STASH_VERSION}.tar.gz \
      | tar xzf - --strip=1 -C /opt/stash \
    && perl -i -p -e 's/^JVM_SUPPORT/#JVM_SUPPORT/' /opt/stash/bin/setenv.sh \
    && perl -i -p -e 's/^# umask 0027/umask 0027/'  /opt/stash/bin/setenv.sh \
    && chown -R stash:stash /opt/stash

WORKDIR /opt/stash
VOLUME ["/opt/stash-home"]
USER stash
ENV HOME ${STASH_HOME}

CMD ["/opt/stash/bin/catalina.sh", "run"]
