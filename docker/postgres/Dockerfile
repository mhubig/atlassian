FROM postgres:9.3
ADD setup-jira-db.sh /docker-entrypoint-initdb.d/
ADD setup-stash-db.sh /docker-entrypoint-initdb.d/
ADD setup-crowd-db.sh /docker-entrypoint-initdb.d/
ADD setup-confluence-db.sh /docker-entrypoint-initdb.d/
