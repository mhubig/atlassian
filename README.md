## Atlassian services

This repository holds a dockerized orchestration of the Atlassian web apps
Jira, Stash and Confluence. To simplify the usermangement Crowd is also
included. For more information on the apps please refere to the offical
Atlassian websites:

- [Jira](https://www.atlassian.com/software/jira)
- [Stash](https://www.atlassian.com/software/stash)
- [Confluence](https://www.atlassian.com/software/confluence)
- [Crowd](https://www.atlassian.com/software/crowd)

### Prerequisites

In order to run this apps you need to make sure you're running at least
[docker 1.3.1](https://docker.com) and [fig 1.0.1](http://fig.sh). For
detailed installation instructions please refere to the origin websites:

  - [http://docs.docker.com/installation](http://docs.docker.com/installation)
  - [http://www.fig.sh/install.html](http://www.fig.sh/install.html)

### Deploy/Update the application

    # rebuild the docker images
    $ fig build

    # restart the docker images
    $ fig up -d

    # inspect the logs
    $ fig logs

If you deploy the apps for the first time you may need to restore the database
from a backup for each app and adapt the database connection settings!

### Debug (aka. go inside) an image

    # execute a bash shell
    $ docker exec -it atlassian_stash_1 bash

### First run

If you start this orchestration for the first time, a handy feature is to
import your old data. If you're e.g. moving everything to another server
you can put your database backups into the tmp folder and the db initscript
will pick them up automagically on the first run.

    # move your jira db backup file to tmp (filename is important).
    $ mv jira_backup.sql tmp/jira.dump

    # unpack your jira-home backup archive
    $ tar xzf jira-home.tar.gz --strip=1 -C jira-home

### Backup the home folders

    $ mkdir -p backup/$(date +%F)
    $ for i in crowd confluence stash jira; do \
      tar czf backup/$(date +%F)/$i-home.tgz $i-home; done

### Backup the PostgreSQL data

    # backup the confluence database
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump -U confluence -h "$DB_PORT_5432_TCP_ADDR" \
        -w confluence > /tmp/confluence.dump'

    # backup the stash database
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump -U stash -h "$DB_PORT_5432_TCP_ADDR" \
        -w stash > /tmp/stash.dump'

    # backup the jira database
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump -U jira -h "$DB_PORT_5432_TCP_ADDR" \
        -w jira > /tmp/jira.dump'

    # backup the crowd database
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_dump -U crowd -h "$DB_PORT_5432_TCP_ADDR" \
        -w crowd > /tmp/crowd.dump'

### Restore the PostgreSQL data

    # restore the confluence database backup
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore -U confluence -h "$DB_PORT_5432_TCP_ADDR" \
        -n public -w -d confluence /tmp/confluence.dump'

    # restore the stash database backup
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore -U stash -h "$DB_PORT_5432_TCP_ADDR" \
        -n public -w -d stash /tmp/stash.dump'

    # restore the jira database backup
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore -U jira -h "$DB_PORT_5432_TCP_ADDR" \
        -n public -w -d jira /tmp/jira.dump'

    # restore the crowd database backup
    $ docker run -it --rm --link atlassian_database_1:db -v $(pwd):/tmp \
        postgres sh -c 'pg_restore -U crowd -h "$DB_PORT_5432_TCP_ADDR" \
        -n public -w -d crowd /tmp/crowd.dump'

